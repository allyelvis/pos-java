// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// API docs from [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web).
// Attributions and copyright licensing by Mozilla Contributors is licensed
// under [CC-BY-SA 2.5](https://creativecommons.org/licenses/by-sa/2.5/.

// Generated from Web IDL definitions.

@JS()
library;

import 'dart:js_interop';

import 'hr_time.dart';
import 'webrtc.dart';

typedef RTCStatsType = String;
typedef RTCQualityLimitationReason = String;
typedef RTCDtlsRole = String;
typedef RTCStatsIceCandidatePairState = String;

/// The [RTCRtpStreamStats] dictionary is returned by the
/// [RTCPeerConnection.getStats], [RTCRtpSender.getStats], and
/// [RTCRtpReceiver.getStats] methods to provide detailed statistics about
/// WebRTC connectivity.
///
/// While the dictionary has a base set of properties that are present in each
/// of these cases, there are also additional properties added depending on
/// which interface the method is called on.
///
/// `RTCRtpStreamStats` is the base class for all RTP-related statistics
/// reports.
///
/// > **Note:** This interface was called `RTCRTPStreamStats` until a
/// > specification update in the spring of 2017.
/// > Check the [Browser compatibility](#browser_compatibility) table to know if
/// > and when the name change was implemented in specific browsers.
extension type RTCRtpStreamStats._(JSObject _) implements RTCStats, JSObject {
  external factory RTCRtpStreamStats({
    required int ssrc,
    required String kind,
    String transportId,
    String codecId,
  });

  external set ssrc(int value);
  external int get ssrc;
  external set kind(String value);
  external String get kind;
  external set transportId(String value);
  external String get transportId;
  external set codecId(String value);
  external String get codecId;
}
extension type RTCCodecStats._(JSObject _) implements RTCStats, JSObject {
  external factory RTCCodecStats({
    required int payloadType,
    required String transportId,
    required String mimeType,
    int clockRate,
    int channels,
    String sdpFmtpLine,
  });

  external set payloadType(int value);
  external int get payloadType;
  external set transportId(String value);
  external String get transportId;
  external set mimeType(String value);
  external String get mimeType;
  external set clockRate(int value);
  external int get clockRate;
  external set channels(int value);
  external int get channels;
  external set sdpFmtpLine(String value);
  external String get sdpFmtpLine;
}
extension type RTCReceivedRtpStreamStats._(JSObject _)
    implements RTCRtpStreamStats, JSObject {
  external factory RTCReceivedRtpStreamStats({
    int packetsReceived,
    int packetsLost,
    num jitter,
  });

  external set packetsReceived(int value);
  external int get packetsReceived;
  external set packetsLost(int value);
  external int get packetsLost;
  external set jitter(num value);
  external num get jitter;
}

/// The **`RTCInboundRtpStreamStats`** dictionary of the
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) is
/// used to report statistics related to the receiving end of an RTP stream on
/// the local end of the [RTCPeerConnection].
///
/// The statistics can be obtained by iterating the [RTCStatsReport] returned by
/// [RTCPeerConnection.getStats] or [RTCRtpReceiver.getStats] until you find a
/// report with the [`type`](#type) of `inbound-rtp`.
extension type RTCInboundRtpStreamStats._(JSObject _)
    implements RTCReceivedRtpStreamStats, JSObject {
  external factory RTCInboundRtpStreamStats({
    required String trackIdentifier,
    String mid,
    String remoteId,
    int framesDecoded,
    int keyFramesDecoded,
    int framesRendered,
    int framesDropped,
    int frameWidth,
    int frameHeight,
    num framesPerSecond,
    int qpSum,
    num totalDecodeTime,
    num totalInterFrameDelay,
    num totalSquaredInterFrameDelay,
    int pauseCount,
    num totalPausesDuration,
    int freezeCount,
    num totalFreezesDuration,
    DOMHighResTimeStamp lastPacketReceivedTimestamp,
    int headerBytesReceived,
    int packetsDiscarded,
    int fecBytesReceived,
    int fecPacketsReceived,
    int fecPacketsDiscarded,
    int bytesReceived,
    int nackCount,
    int firCount,
    int pliCount,
    num totalProcessingDelay,
    DOMHighResTimeStamp estimatedPlayoutTimestamp,
    num jitterBufferDelay,
    num jitterBufferTargetDelay,
    int jitterBufferEmittedCount,
    num jitterBufferMinimumDelay,
    int totalSamplesReceived,
    int concealedSamples,
    int silentConcealedSamples,
    int concealmentEvents,
    int insertedSamplesForDeceleration,
    int removedSamplesForAcceleration,
    num audioLevel,
    num totalAudioEnergy,
    num totalSamplesDuration,
    int framesReceived,
    String decoderImplementation,
    String playoutId,
    bool powerEfficientDecoder,
    int framesAssembledFromMultiplePackets,
    num totalAssemblyTime,
    int retransmittedPacketsReceived,
    int retransmittedBytesReceived,
    int rtxSsrc,
    int fecSsrc,
  });

  external set trackIdentifier(String value);
  external String get trackIdentifier;
  external set mid(String value);
  external String get mid;
  external set remoteId(String value);
  external String get remoteId;
  external set framesDecoded(int value);
  external int get framesDecoded;
  external set keyFramesDecoded(int value);
  external int get keyFramesDecoded;
  external set framesRendered(int value);
  external int get framesRendered;
  external set framesDropped(int value);
  external int get framesDropped;
  external set frameWidth(int value);
  external int get frameWidth;
  external set frameHeight(int value);
  external int get frameHeight;
  external set framesPerSecond(num value);
  external num get framesPerSecond;
  external set qpSum(int value);
  external int get qpSum;
  external set totalDecodeTime(num value);
  external num get totalDecodeTime;
  external set totalInterFrameDelay(num value);
  external num get totalInterFrameDelay;
  external set totalSquaredInterFrameDelay(num value);
  external num get totalSquaredInterFrameDelay;
  external set pauseCount(int value);
  external int get pauseCount;
  external set totalPausesDuration(num value);
  external num get totalPausesDuration;
  external set freezeCount(int value);
  external int get freezeCount;
  external set totalFreezesDuration(num value);
  external num get totalFreezesDuration;
  external set lastPacketReceivedTimestamp(DOMHighResTimeStamp value);
  external DOMHighResTimeStamp get lastPacketReceivedTimestamp;
  external set headerBytesReceived(int value);
  external int get headerBytesReceived;
  external set packetsDiscarded(int value);
  external int get packetsDiscarded;
  external set fecBytesReceived(int value);
  external int get fecBytesReceived;
  external set fecPacketsReceived(int value);
  external int get fecPacketsReceived;
  external set fecPacketsDiscarded(int value);
  external int get fecPacketsDiscarded;
  external set bytesReceived(int value);
  external int get bytesReceived;
  external set nackCount(int value);
  external int get nackCount;
  external set firCount(int value);
  external int get firCount;
  external set pliCount(int value);
  external int get pliCount;
  external set totalProcessingDelay(num value);
  external num get totalProcessingDelay;
  external set estimatedPlayoutTimestamp(DOMHighResTimeStamp value);
  external DOMHighResTimeStamp get estimatedPlayoutTimestamp;
  external set jitterBufferDelay(num value);
  external num get jitterBufferDelay;
  external set jitterBufferTargetDelay(num value);
  external num get jitterBufferTargetDelay;
  external set jitterBufferEmittedCount(int value);
  external int get jitterBufferEmittedCount;
  external set jitterBufferMinimumDelay(num value);
  external num get jitterBufferMinimumDelay;
  external set totalSamplesReceived(int value);
  external int get totalSamplesReceived;
  external set concealedSamples(int value);
  external int get concealedSamples;
  external set silentConcealedSamples(int value);
  external int get silentConcealedSamples;
  external set concealmentEvents(int value);
  external int get concealmentEvents;
  external set insertedSamplesForDeceleration(int value);
  external int get insertedSamplesForDeceleration;
  external set removedSamplesForAcceleration(int value);
  external int get removedSamplesForAcceleration;
  external set audioLevel(num value);
  external num get audioLevel;
  external set totalAudioEnergy(num value);
  external num get totalAudioEnergy;
  external set totalSamplesDuration(num value);
  external num get totalSamplesDuration;
  external set framesReceived(int value);
  external int get framesReceived;
  external set decoderImplementation(String value);
  external String get decoderImplementation;
  external set playoutId(String value);
  external String get playoutId;
  external set powerEfficientDecoder(bool value);
  external bool get powerEfficientDecoder;
  external set framesAssembledFromMultiplePackets(int value);
  external int get framesAssembledFromMultiplePackets;
  external set totalAssemblyTime(num value);
  external num get totalAssemblyTime;
  external set retransmittedPacketsReceived(int value);
  external int get retransmittedPacketsReceived;
  external set retransmittedBytesReceived(int value);
  external int get retransmittedBytesReceived;
  external set rtxSsrc(int value);
  external int get rtxSsrc;
  external set fecSsrc(int value);
  external int get fecSsrc;
}
extension type RTCRemoteInboundRtpStreamStats._(JSObject _)
    implements RTCReceivedRtpStreamStats, JSObject {
  external factory RTCRemoteInboundRtpStreamStats({
    String localId,
    num roundTripTime,
    num totalRoundTripTime,
    num fractionLost,
    int roundTripTimeMeasurements,
  });

  external set localId(String value);
  external String get localId;
  external set roundTripTime(num value);
  external num get roundTripTime;
  external set totalRoundTripTime(num value);
  external num get totalRoundTripTime;
  external set fractionLost(num value);
  external num get fractionLost;
  external set roundTripTimeMeasurements(int value);
  external int get roundTripTimeMeasurements;
}
extension type RTCSentRtpStreamStats._(JSObject _)
    implements RTCRtpStreamStats, JSObject {
  external factory RTCSentRtpStreamStats({
    int packetsSent,
    int bytesSent,
  });

  external set packetsSent(int value);
  external int get packetsSent;
  external set bytesSent(int value);
  external int get bytesSent;
}

/// The **`RTCOutboundRtpStreamStats`** dictionary of the
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) is
/// used to report metrics and statistics related to an outbound  stream being
/// sent by an [RTCRtpSender].
///
/// The statistics can be obtained by iterating the [RTCStatsReport] returned by
/// [RTCPeerConnection.getStats] or [RTCRtpSender.getStats] until you find a
/// report with the [`type`](#type) of `outbound-rtp`.
extension type RTCOutboundRtpStreamStats._(JSObject _)
    implements RTCSentRtpStreamStats, JSObject {
  external factory RTCOutboundRtpStreamStats({
    String mid,
    String mediaSourceId,
    String remoteId,
    String rid,
    int headerBytesSent,
    int retransmittedPacketsSent,
    int retransmittedBytesSent,
    int rtxSsrc,
    num targetBitrate,
    int totalEncodedBytesTarget,
    int frameWidth,
    int frameHeight,
    num framesPerSecond,
    int framesSent,
    int hugeFramesSent,
    int framesEncoded,
    int keyFramesEncoded,
    int qpSum,
    num totalEncodeTime,
    num totalPacketSendDelay,
    RTCQualityLimitationReason qualityLimitationReason,
    JSObject qualityLimitationDurations,
    int qualityLimitationResolutionChanges,
    int nackCount,
    int firCount,
    int pliCount,
    String encoderImplementation,
    bool powerEfficientEncoder,
    bool active,
    String scalabilityMode,
  });

  external set mid(String value);
  external String get mid;
  external set mediaSourceId(String value);
  external String get mediaSourceId;
  external set remoteId(String value);
  external String get remoteId;
  external set rid(String value);
  external String get rid;
  external set headerBytesSent(int value);
  external int get headerBytesSent;
  external set retransmittedPacketsSent(int value);
  external int get retransmittedPacketsSent;
  external set retransmittedBytesSent(int value);
  external int get retransmittedBytesSent;
  external set rtxSsrc(int value);
  external int get rtxSsrc;
  external set targetBitrate(num value);
  external num get targetBitrate;
  external set totalEncodedBytesTarget(int value);
  external int get totalEncodedBytesTarget;
  external set frameWidth(int value);
  external int get frameWidth;
  external set frameHeight(int value);
  external int get frameHeight;
  external set framesPerSecond(num value);
  external num get framesPerSecond;
  external set framesSent(int value);
  external int get framesSent;
  external set hugeFramesSent(int value);
  external int get hugeFramesSent;
  external set framesEncoded(int value);
  external int get framesEncoded;
  external set keyFramesEncoded(int value);
  external int get keyFramesEncoded;
  external set qpSum(int value);
  external int get qpSum;
  external set totalEncodeTime(num value);
  external num get totalEncodeTime;
  external set totalPacketSendDelay(num value);
  external num get totalPacketSendDelay;
  external set qualityLimitationReason(RTCQualityLimitationReason value);
  external RTCQualityLimitationReason get qualityLimitationReason;
  external set qualityLimitationDurations(JSObject value);
  external JSObject get qualityLimitationDurations;
  external set qualityLimitationResolutionChanges(int value);
  external int get qualityLimitationResolutionChanges;
  external set nackCount(int value);
  external int get nackCount;
  external set firCount(int value);
  external int get firCount;
  external set pliCount(int value);
  external int get pliCount;
  external set encoderImplementation(String value);
  external String get encoderImplementation;
  external set powerEfficientEncoder(bool value);
  external bool get powerEfficientEncoder;
  external set active(bool value);
  external bool get active;
  external set scalabilityMode(String value);
  external String get scalabilityMode;
}

/// The **`RTCRemoteOutboundRtpStreamStats`** dictionary of the
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) is
/// used to report statistics from remote endpoint of its outbound RTP stream,
/// which corresponds to an inbound stream that is currently received by an
/// [RTCPeerConnection] object.
///
/// The statistics can be obtained by iterating the [RTCStatsReport] returned by
/// [RTCPeerConnection.getStats] until you find a report with the
/// [`type`](#type) of `remote-outbound-rtp`.
extension type RTCRemoteOutboundRtpStreamStats._(JSObject _)
    implements RTCSentRtpStreamStats, JSObject {
  external factory RTCRemoteOutboundRtpStreamStats({
    String localId,
    DOMHighResTimeStamp remoteTimestamp,
    int reportsSent,
    num roundTripTime,
    num totalRoundTripTime,
    int roundTripTimeMeasurements,
  });

  external set localId(String value);
  external String get localId;
  external set remoteTimestamp(DOMHighResTimeStamp value);
  external DOMHighResTimeStamp get remoteTimestamp;
  external set reportsSent(int value);
  external int get reportsSent;
  external set roundTripTime(num value);
  external num get roundTripTime;
  external set totalRoundTripTime(num value);
  external num get totalRoundTripTime;
  external set roundTripTimeMeasurements(int value);
  external int get roundTripTimeMeasurements;
}
extension type RTCMediaSourceStats._(JSObject _) implements RTCStats, JSObject {
  external factory RTCMediaSourceStats({
    required String trackIdentifier,
    required String kind,
  });

  external set trackIdentifier(String value);
  external String get trackIdentifier;
  external set kind(String value);
  external String get kind;
}

/// The
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API)'s
/// **`RTCAudioSourceStats`** dictionary provides information about an audio
/// track that is attached to one or more senders.
///
/// These statistics can be obtained by iterating the [RTCStatsReport] returned
/// by [RTCRtpSender.getStats] or [RTCPeerConnection.getStats] until you find a
/// report with the [`type`](#type) of `media-source` and a [`kind`](#kind) of
/// `audio`.
///
/// > **Note:** For audio information about remotely sourced tracks (that are
/// > being received), see [RTCInboundRtpStreamStats].
extension type RTCAudioSourceStats._(JSObject _)
    implements RTCMediaSourceStats, JSObject {
  external factory RTCAudioSourceStats({
    num audioLevel,
    num totalAudioEnergy,
    num totalSamplesDuration,
    num echoReturnLoss,
    num echoReturnLossEnhancement,
  });

  external set audioLevel(num value);
  external num get audioLevel;
  external set totalAudioEnergy(num value);
  external num get totalAudioEnergy;
  external set totalSamplesDuration(num value);
  external num get totalSamplesDuration;
  external set echoReturnLoss(num value);
  external num get echoReturnLoss;
  external set echoReturnLossEnhancement(num value);
  external num get echoReturnLossEnhancement;
}
extension type RTCVideoSourceStats._(JSObject _)
    implements RTCMediaSourceStats, JSObject {
  external factory RTCVideoSourceStats({
    int width,
    int height,
    int frames,
    num framesPerSecond,
  });

  external set width(int value);
  external int get width;
  external set height(int value);
  external int get height;
  external set frames(int value);
  external int get frames;
  external set framesPerSecond(num value);
  external num get framesPerSecond;
}
extension type RTCAudioPlayoutStats._(JSObject _)
    implements RTCStats, JSObject {
  external factory RTCAudioPlayoutStats({
    required String kind,
    num synthesizedSamplesDuration,
    int synthesizedSamplesEvents,
    num totalSamplesDuration,
    num totalPlayoutDelay,
    int totalSamplesCount,
  });

  external set kind(String value);
  external String get kind;
  external set synthesizedSamplesDuration(num value);
  external num get synthesizedSamplesDuration;
  external set synthesizedSamplesEvents(int value);
  external int get synthesizedSamplesEvents;
  external set totalSamplesDuration(num value);
  external num get totalSamplesDuration;
  external set totalPlayoutDelay(num value);
  external num get totalPlayoutDelay;
  external set totalSamplesCount(int value);
  external int get totalSamplesCount;
}

/// The **`RTCPeerConnectionStats`** dictionary of the
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API)
/// provides information about the high level peer connection
/// ([RTCPeerConnection]).
///
/// In particular, it provides the number of unique data channels that have been
/// opened, and the number of opened channels that have been closed.
/// This allows the current number of open channels to be calculated.
///
/// These statistics can be obtained by iterating the [RTCStatsReport] returned
/// by [RTCPeerConnection.getStats] until you find a report with the
/// [`type`](#type) of `peer-connection`.
extension type RTCPeerConnectionStats._(JSObject _)
    implements RTCStats, JSObject {
  external factory RTCPeerConnectionStats({
    int dataChannelsOpened,
    int dataChannelsClosed,
  });

  external set dataChannelsOpened(int value);
  external int get dataChannelsOpened;
  external set dataChannelsClosed(int value);
  external int get dataChannelsClosed;
}
extension type RTCDataChannelStats._(JSObject _) implements RTCStats, JSObject {
  external factory RTCDataChannelStats({
    String label,
    String protocol,
    int dataChannelIdentifier,
    required RTCDataChannelState state,
    int messagesSent,
    int bytesSent,
    int messagesReceived,
    int bytesReceived,
  });

  external set label(String value);
  external String get label;
  external set protocol(String value);
  external String get protocol;
  external set dataChannelIdentifier(int value);
  external int get dataChannelIdentifier;
  external set state(RTCDataChannelState value);
  external RTCDataChannelState get state;
  external set messagesSent(int value);
  external int get messagesSent;
  external set bytesSent(int value);
  external int get bytesSent;
  external set messagesReceived(int value);
  external int get messagesReceived;
  external set bytesReceived(int value);
  external int get bytesReceived;
}

/// The **`RTCTransportStats`** dictionary of the
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API)
/// provides information about the transport ([RTCDtlsTransport] and its
/// underlying [RTCIceTransport]) used by a particular candidate pair.
///
/// The _BUNDLE_ feature is an SDP extension that allows negotiation to use a
/// single transport for sending and receiving media described by multiple SDP
/// media descriptions.
/// If the remote endpoint is aware of this feature, all [MediaStreamTrack] and
/// data channels are bundled onto a single transport at the completion of
/// negotiation.
/// This is true for current browsers, but if connecting to an older endpoint
/// that is not BUNDLE-aware, then separate transports might be used for
/// different media.
/// The policy to use in the negotiation is configured in the
/// [`RTCPeerConnection` constructor](https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection).
///
/// These statistics can be obtained by iterating the [RTCStatsReport] returned
/// by [RTCPeerConnection.getStats] until you find a report with the
/// [`type`](#type) of `transport`.
extension type RTCTransportStats._(JSObject _) implements RTCStats, JSObject {
  external factory RTCTransportStats({
    int packetsSent,
    int packetsReceived,
    int bytesSent,
    int bytesReceived,
    RTCIceRole iceRole,
    String iceLocalUsernameFragment,
    required RTCDtlsTransportState dtlsState,
    RTCIceTransportState iceState,
    String selectedCandidatePairId,
    String localCertificateId,
    String remoteCertificateId,
    String tlsVersion,
    String dtlsCipher,
    RTCDtlsRole dtlsRole,
    String srtpCipher,
    int selectedCandidatePairChanges,
  });

  external set packetsSent(int value);
  external int get packetsSent;
  external set packetsReceived(int value);
  external int get packetsReceived;
  external set bytesSent(int value);
  external int get bytesSent;
  external set bytesReceived(int value);
  external int get bytesReceived;
  external set iceRole(RTCIceRole value);
  external RTCIceRole get iceRole;
  external set iceLocalUsernameFragment(String value);
  external String get iceLocalUsernameFragment;
  external set dtlsState(RTCDtlsTransportState value);
  external RTCDtlsTransportState get dtlsState;
  external set iceState(RTCIceTransportState value);
  external RTCIceTransportState get iceState;
  external set selectedCandidatePairId(String value);
  external String get selectedCandidatePairId;
  external set localCertificateId(String value);
  external String get localCertificateId;
  external set remoteCertificateId(String value);
  external String get remoteCertificateId;
  external set tlsVersion(String value);
  external String get tlsVersion;
  external set dtlsCipher(String value);
  external String get dtlsCipher;
  external set dtlsRole(RTCDtlsRole value);
  external RTCDtlsRole get dtlsRole;
  external set srtpCipher(String value);
  external String get srtpCipher;
  external set selectedCandidatePairChanges(int value);
  external int get selectedCandidatePairChanges;
}

/// The **`RTCIceCandidateStats`** dictionary of the
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) is
/// used to report statistics related to an [RTCIceCandidate].
///
/// The statistics can be obtained by iterating the [RTCStatsReport] returned by
/// [RTCPeerConnection.getStats] until you find a report with the
/// [`type`](#type) of `local-candidate`.
extension type RTCIceCandidateStats._(JSObject _)
    implements RTCStats, JSObject {
  external factory RTCIceCandidateStats({
    required String transportId,
    String? address,
    int port,
    String protocol,
    required RTCIceCandidateType candidateType,
    int priority,
    String url,
    RTCIceServerTransportProtocol relayProtocol,
    String foundation,
    String relatedAddress,
    int relatedPort,
    String usernameFragment,
    RTCIceTcpCandidateType tcpType,
  });

  external set transportId(String value);
  external String get transportId;
  external set address(String? value);
  external String? get address;
  external set port(int value);
  external int get port;
  external set protocol(String value);
  external String get protocol;
  external set candidateType(RTCIceCandidateType value);
  external RTCIceCandidateType get candidateType;
  external set priority(int value);
  external int get priority;
  external set url(String value);
  external String get url;
  external set relayProtocol(RTCIceServerTransportProtocol value);
  external RTCIceServerTransportProtocol get relayProtocol;
  external set foundation(String value);
  external String get foundation;
  external set relatedAddress(String value);
  external String get relatedAddress;
  external set relatedPort(int value);
  external int get relatedPort;
  external set usernameFragment(String value);
  external String get usernameFragment;
  external set tcpType(RTCIceTcpCandidateType value);
  external RTCIceTcpCandidateType get tcpType;
}

/// The **`RTCIceCandidatePairStats`** dictionary of the
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) is
/// used to report statistics that provide insight into the quality and
/// performance of an [RTCPeerConnection] while connected and configured as
/// described by the specified pair of  candidates.
///
/// The statistics can be obtained by iterating the [RTCStatsReport] returned by
/// [RTCPeerConnection.getStats] until you find an entry with the
/// [`type`](#type) of `"candidate-pair"`.
extension type RTCIceCandidatePairStats._(JSObject _)
    implements RTCStats, JSObject {
  external factory RTCIceCandidatePairStats({
    required String transportId,
    required String localCandidateId,
    required String remoteCandidateId,
    required RTCStatsIceCandidatePairState state,
    bool nominated,
    int packetsSent,
    int packetsReceived,
    int bytesSent,
    int bytesReceived,
    DOMHighResTimeStamp lastPacketSentTimestamp,
    DOMHighResTimeStamp lastPacketReceivedTimestamp,
    num totalRoundTripTime,
    num currentRoundTripTime,
    num availableOutgoingBitrate,
    num availableIncomingBitrate,
    int requestsReceived,
    int requestsSent,
    int responsesReceived,
    int responsesSent,
    int consentRequestsSent,
    int packetsDiscardedOnSend,
    int bytesDiscardedOnSend,
  });

  external set transportId(String value);
  external String get transportId;
  external set localCandidateId(String value);
  external String get localCandidateId;
  external set remoteCandidateId(String value);
  external String get remoteCandidateId;
  external set state(RTCStatsIceCandidatePairState value);
  external RTCStatsIceCandidatePairState get state;
  external set nominated(bool value);
  external bool get nominated;
  external set packetsSent(int value);
  external int get packetsSent;
  external set packetsReceived(int value);
  external int get packetsReceived;
  external set bytesSent(int value);
  external int get bytesSent;
  external set bytesReceived(int value);
  external int get bytesReceived;
  external set lastPacketSentTimestamp(DOMHighResTimeStamp value);
  external DOMHighResTimeStamp get lastPacketSentTimestamp;
  external set lastPacketReceivedTimestamp(DOMHighResTimeStamp value);
  external DOMHighResTimeStamp get lastPacketReceivedTimestamp;
  external set totalRoundTripTime(num value);
  external num get totalRoundTripTime;
  external set currentRoundTripTime(num value);
  external num get currentRoundTripTime;
  external set availableOutgoingBitrate(num value);
  external num get availableOutgoingBitrate;
  external set availableIncomingBitrate(num value);
  external num get availableIncomingBitrate;
  external set requestsReceived(int value);
  external int get requestsReceived;
  external set requestsSent(int value);
  external int get requestsSent;
  external set responsesReceived(int value);
  external int get responsesReceived;
  external set responsesSent(int value);
  external int get responsesSent;
  external set consentRequestsSent(int value);
  external int get consentRequestsSent;
  external set packetsDiscardedOnSend(int value);
  external int get packetsDiscardedOnSend;
  external set bytesDiscardedOnSend(int value);
  external int get bytesDiscardedOnSend;
}

/// The **`RTCCertificateStats`** dictionary of the
/// [WebRTC API](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) is
/// used to report information about a certificate used by an [RTCDtlsTransport]
/// and its underlying [RTCIceTransport].
///
/// The report can be obtained by iterating the [RTCStatsReport] returned by
/// [RTCPeerConnection.getStats] until you find an entry with the
/// [`type`](#type) of `certificate`.
extension type RTCCertificateStats._(JSObject _) implements RTCStats, JSObject {
  external factory RTCCertificateStats({
    required String fingerprint,
    required String fingerprintAlgorithm,
    required String base64Certificate,
    String issuerCertificateId,
  });

  external set fingerprint(String value);
  external String get fingerprint;
  external set fingerprintAlgorithm(String value);
  external String get fingerprintAlgorithm;
  external set base64Certificate(String value);
  external String get base64Certificate;
  external set issuerCertificateId(String value);
  external String get issuerCertificateId;
}
