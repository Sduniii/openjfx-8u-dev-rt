/*
 * Copyright (C) 2008 Apple Inc. All Rights Reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#ifndef WorkerMessagingProxy_h
#define WorkerMessagingProxy_h

#include "ScriptExecutionContext.h"
#include "WorkerGlobalScopeProxy.h"
#include "WorkerLoaderProxy.h"
#include "WorkerObjectProxy.h"
#include <memory>
#include <wtf/Forward.h>
#include <wtf/Noncopyable.h>
#include <wtf/PassRefPtr.h>
#include <wtf/RefPtr.h>
#include <wtf/Vector.h>

namespace WebCore {

    class DedicatedWorkerThread;
    class ScriptExecutionContext;
    class Worker;

    class WorkerMessagingProxy : public WorkerGlobalScopeProxy, public WorkerObjectProxy, public WorkerLoaderProxy {
        WTF_MAKE_NONCOPYABLE(WorkerMessagingProxy); WTF_MAKE_FAST_ALLOCATED;
    public:
        explicit WorkerMessagingProxy(Worker*);

        // Implementations of WorkerGlobalScopeProxy.
        // (Only use these methods in the worker object thread.)
        virtual void startWorkerGlobalScope(const URL& scriptURL, const String& userAgent, const String& sourceCode, WorkerThreadStartMode) override;
        virtual void terminateWorkerGlobalScope() override;
        virtual void postMessageToWorkerGlobalScope(PassRefPtr<SerializedScriptValue>, std::unique_ptr<MessagePortChannelArray>) override;
        virtual bool hasPendingActivity() const override;
        virtual void workerObjectDestroyed() override;
        virtual void notifyNetworkStateChange(bool isOnline) override;

        virtual void connectToInspector(WorkerGlobalScopeProxy::PageInspector*) override;
        virtual void disconnectFromInspector() override;
        virtual void sendMessageToInspector(const String&) override;

        // Implementations of WorkerObjectProxy.
        // (Only use these methods in the worker context thread.)
        virtual void postMessageToWorkerObject(PassRefPtr<SerializedScriptValue>, std::unique_ptr<MessagePortChannelArray>) override;
        virtual void postExceptionToWorkerObject(const String& errorMessage, int lineNumber, int columnNumber, const String& sourceURL) override;
        virtual void postConsoleMessageToWorkerObject(MessageSource, MessageLevel, const String& message, int lineNumber, int columnNumber, const String& sourceURL) override;
        virtual void postMessageToPageInspector(const String&) override;
        virtual void confirmMessageFromWorkerObject(bool hasPendingActivity) override;
        virtual void reportPendingActivity(bool hasPendingActivity) override;
        virtual void workerGlobalScopeClosed() override;
        virtual void workerGlobalScopeDestroyed() override;

        // Implementation of WorkerLoaderProxy.
        // These methods are called on different threads to schedule loading
        // requests and to send callbacks back to WorkerGlobalScope.
        virtual void postTaskToLoader(ScriptExecutionContext::Task) override;
        virtual bool postTaskForModeToWorkerGlobalScope(ScriptExecutionContext::Task, const String& mode) override;

        void workerThreadCreated(PassRefPtr<DedicatedWorkerThread>);

        // Only use this method on the worker object thread.
        bool askedToTerminate() const { return m_askedToTerminate; }

    protected:
        virtual ~WorkerMessagingProxy();

    private:
        friend class MessageWorkerTask;
        friend class PostMessageToPageInspectorTask;
        friend class WorkerGlobalScopeDestroyedTask;
        friend class WorkerExceptionTask;
        friend class WorkerThreadActivityReportTask;

        void workerGlobalScopeDestroyedInternal();
        void reportPendingActivityInternal(bool confirmingMessage, bool hasPendingActivity);
        Worker* workerObject() const { return m_workerObject; }

        RefPtr<ScriptExecutionContext> m_scriptExecutionContext;
        Worker* m_workerObject;
        bool m_mayBeDestroyed;
        RefPtr<DedicatedWorkerThread> m_workerThread;

        unsigned m_unconfirmedMessageCount; // Unconfirmed messages from worker object to worker thread.
        bool m_workerThreadHadPendingActivity; // The latest confirmation from worker thread reported that it was still active.

        bool m_askedToTerminate;

        Vector<std::unique_ptr<ScriptExecutionContext::Task>> m_queuedEarlyTasks; // Tasks are queued here until there's a thread object created.
        WorkerGlobalScopeProxy::PageInspector* m_pageInspector;
    };

} // namespace WebCore

#endif // WorkerMessagingProxy_h
