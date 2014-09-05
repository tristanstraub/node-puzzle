Noise = require '../src/noise'
Transmitter = require '../src/transmitter'
expect = require 'expect.js'
Encoder = require '../src/encoder'

describe 'Noise transmitter', ->
  describe 'encode/decode', ->
    test = (noiseProbability) ->
      randomBoolean = -> Math.random() >= 1 - noiseProbability

      noise = new Noise({randomBoolean})
      encoder = new Encoder()

      transmitter = new Transmitter {encoder, noise}

      n = 10
      bits = [0...10].map -> Math.random() >= 0.5

      expect(transmitter.transmit bits).to.eql bits

    it 'should be able to transmit signal without loss on perfect channel', ->
      for i in [0..10]
        test 0

    it 'should be able to transmit signal without loss on slightly noise channel', ->
      for i in [0..10]
        test 0.2

    it 'should be able to transmit signal without loss on very noise channel', ->
      for i in [0..10]
        test 0.7
