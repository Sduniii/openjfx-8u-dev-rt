/*
 * Copyright (C) 2015 Apple Inc. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1.  Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 * 2.  Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#if USE(QUICK_LOOK)

#include "QuickLookSPI.h"
#include "SoftLinking.h"

SOFT_LINK_FRAMEWORK_FOR_HEADER(WebCore, QuickLook)

SOFT_LINK_CLASS_FOR_HEADER(WebCore, QuickLook, QLPreviewConverter)

SOFT_LINK_FUNCTION_FOR_HEADER(WebCore, QuickLook, QLPreviewGetSupportedMIMETypes, NSSet *, (), ())
#define QLPreviewGetSupportedMIMETypes softLink_QuickLook_QLPreviewGetSupportedMIMETypes
SOFT_LINK_FUNCTION_FOR_HEADER(WebCore, QuickLook, QLTypeCopyBestMimeTypeForFileNameAndMimeType, NSString *, (NSString *fileName, NSString *mimeType), (fileName, mimeType))
#define QLTypeCopyBestMimeTypeForFileNameAndMimeType softLink_QuickLook_QLTypeCopyBestMimeTypeForFileNameAndMimeType
SOFT_LINK_FUNCTION_FOR_HEADER(WebCore, QuickLook, QLTypeCopyBestMimeTypeForURLAndMimeType, NSString *, (NSURL *url, NSString *mimeType), (url, mimeType))
#define QLTypeCopyBestMimeTypeForURLAndMimeType softLink_QuickLook_QLTypeCopyBestMimeTypeForURLAndMimeType
SOFT_LINK_FUNCTION_FOR_HEADER(WebCore, QuickLook, QLTypeCopyUTIForURLAndMimeType, NSString *, (NSURL *url, NSString *mimeType), (url, mimeType))
#define QLTypeCopyUTIForURLAndMimeType softLink_QuickLook_QLTypeCopyUTIForURLAndMimeType

SOFT_LINK_POINTER_FOR_HEADER(WebCore, QuickLook, QLPreviewScheme, NSString *)
#define QLPreviewScheme get_QuickLook_QLPreviewScheme()

#endif // USE(QUICK_LOOK)
