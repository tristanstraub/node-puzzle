assert = require 'assert'

module.exports = class Transmitter
  constructor: ({@encoder, @noise}) ->
    assert @encoder
    assert @noise

  transmit: (bits) ->
    encoded = @enforceBooleanArray @encoder.encode(bits)
    noisy = @enforceBooleanArray @noise.applyNoise encoded
    decoded = @enforceBooleanArray @encoder.decode noisy

    return decoded

  enforceBooleanArray: (bits) ->
    bits.map Boolean
