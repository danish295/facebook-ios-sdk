// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

@objcMembers
public class FakeURLSessionProxy: NSObject, URLSessionProxying {
  public var delegateQueue: OperationQueue?
  /// The most recent captured completion
  public var capturedCompletion: UrlSessionTaskBlock?
  /// The most recent captured request
  public var capturedRequest: URLRequest?
  /// All captured requests for this networker instance
  public var capturedRequests = [URLRequest]()
  public var invalidateAndCancelCallCount = 0

  public func execute(_ request: URLRequest, completionHandler handler: @escaping UrlSessionTaskBlock) {
    capturedRequest = request
    capturedRequests.append(request)
    capturedCompletion = handler
  }

  public func invalidateAndCancel() {
    invalidateAndCancelCallCount += 1
  }
}
