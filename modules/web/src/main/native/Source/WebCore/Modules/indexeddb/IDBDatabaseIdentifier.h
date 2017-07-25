/*
 * Copyright (C) 2015 Apple Inc. All rights reserved.
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
 */

#pragma once

#if ENABLE(INDEXED_DATABASE)

#include "SecurityOriginData.h"
#include <wtf/Ref.h>
#include <wtf/text/StringHash.h>
#include <wtf/text/WTFString.h>

namespace WebCore {

class SecurityOrigin;

class IDBDatabaseIdentifier {
public:
    IDBDatabaseIdentifier() { }
    IDBDatabaseIdentifier(WTF::HashTableDeletedValueType)
        : m_databaseName(WTF::HashTableDeletedValue)
    {
    }

    IDBDatabaseIdentifier isolatedCopy() const;

    bool isHashTableDeletedValue() const
    {
        return m_databaseName.isHashTableDeletedValue();
    }

    unsigned hash() const
    {
        unsigned nameHash = StringHash::hash(m_databaseName);
        unsigned openingProtocolHash = StringHash::hash(m_openingOrigin.protocol);
        unsigned openingHostHash = StringHash::hash(m_openingOrigin.host);
        unsigned mainFrameProtocolHash = StringHash::hash(m_mainFrameOrigin.protocol);
        unsigned mainFrameHostHash = StringHash::hash(m_mainFrameOrigin.host);

        unsigned hashCodes[7] = { nameHash, openingProtocolHash, openingHostHash, m_openingOrigin.port.value_or(0), mainFrameProtocolHash, mainFrameHostHash, m_mainFrameOrigin.port.value_or(0) };
        return StringHasher::hashMemory<sizeof(hashCodes)>(hashCodes);
    }

    IDBDatabaseIdentifier(const String& databaseName, const SecurityOrigin& openingOrigin, const SecurityOrigin& mainFrameOrigin);

    bool isValid() const
    {
        return !m_databaseName.isNull()
            && !m_databaseName.isHashTableDeletedValue();
    }

    bool isEmpty() const
    {
        return m_databaseName.isNull();
    }

    bool operator==(const IDBDatabaseIdentifier& other) const
    {
        return other.m_databaseName == m_databaseName
            && other.m_openingOrigin == m_openingOrigin
            && other.m_mainFrameOrigin == m_mainFrameOrigin;
    }

    const String& databaseName() const { return m_databaseName; }

    String databaseDirectoryRelativeToRoot(const String& rootDirectory) const;
    static String databaseDirectoryRelativeToRoot(const SecurityOriginData& topLevelOrigin, const SecurityOriginData& openingOrigin, const String& rootDirectory);

    template<class Encoder> void encode(Encoder&) const;
    template<class Decoder> static bool decode(Decoder&, IDBDatabaseIdentifier&);

#if !LOG_DISABLED
    String debugString() const;
#endif

    bool isRelatedToOrigin(const SecurityOriginData& other) const
    {
        return m_openingOrigin == other || m_mainFrameOrigin == other;
    }

private:
    String m_databaseName;
    SecurityOriginData m_openingOrigin;
    SecurityOriginData m_mainFrameOrigin;
};

struct IDBDatabaseIdentifierHash {
    static unsigned hash(const IDBDatabaseIdentifier& a) { return a.hash(); }
    static bool equal(const IDBDatabaseIdentifier& a, const IDBDatabaseIdentifier& b) { return a == b; }
    static const bool safeToCompareToEmptyOrDeleted = false;
};

struct IDBDatabaseIdentifierHashTraits : WTF::SimpleClassHashTraits<IDBDatabaseIdentifier> {
    static const bool hasIsEmptyValueFunction = true;
    static const bool emptyValueIsZero = false;
    static bool isEmptyValue(const IDBDatabaseIdentifier& info) { return info.isEmpty(); }
};

template<class Encoder>
void IDBDatabaseIdentifier::encode(Encoder& encoder) const
{
    encoder << m_databaseName << m_openingOrigin << m_mainFrameOrigin;
}

template<class Decoder>
bool IDBDatabaseIdentifier::decode(Decoder& decoder, IDBDatabaseIdentifier& identifier)
{
    if (!decoder.decode(identifier.m_databaseName))
        return false;

    if (!decoder.decode(identifier.m_openingOrigin))
        return false;

    if (!decoder.decode(identifier.m_mainFrameOrigin))
        return false;

    return true;
}

} // namespace WebCore

namespace WTF {

template<> struct HashTraits<WebCore::IDBDatabaseIdentifier> : WebCore::IDBDatabaseIdentifierHashTraits { };
template<> struct DefaultHash<WebCore::IDBDatabaseIdentifier> {
    typedef WebCore::IDBDatabaseIdentifierHash Hash;
};

} // namespace WTF

#endif // ENABLE(INDEXED_DATABASE)
