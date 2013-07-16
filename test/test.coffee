assert = require 'assert'

describe 'rtURL to be set', ->
  it 'is set', ->
    rtURL = 'https://example.com'
    rtURL.should.equal 'https://example.com'
    
