# :nodoc:
#
# Copyright (C) 2014-2020 Authlete, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


require 'authlete'
require 'minitest/autorun'


class IntrospectionRequestTest < Minitest::Test
  TOKEN   = '<token>'
  SCOPES  = [ 'scope0', 'scope1' ]
  SUBJECT = '<subject>'
  DPOP    = '<dpop>'
  HTU     = '<htu>'
  HTM     = '<htm>'


  def set_params(obj)
    obj.token   = TOKEN
    obj.scopes  = SCOPES
    obj.subject = SUBJECT
    obj.dpop    = DPOP
    obj.htu     = HTU
    obj.htm     = HTM
  end


  def match(obj)
    assert_equal TOKEN,   obj.token
    assert_equal SCOPES,  obj.scopes
    assert_equal SUBJECT, obj.subject
    assert_equal DPOP,    obj.dpop
    assert_equal HTU,     obj.htu
    assert_equal HTM,     obj.htm
  end


  def generate_hash
    {
      token:   '<token>',
      scopes:  [ 'scope0', 'scope1' ],
      subject: '<subject>',
      dpop:    '<dpop>',
      htu:     '<htu>',
      htm:     '<htm>'
    }
  end


  def test_setters
    actual = Authlete::Model::Request::IntrospectionRequest.new
    set_params(actual)

    match(actual)
  end


  def test_to_hash
    obj = Authlete::Model::Request::IntrospectionRequest.new
    set_params(obj)
    actual   = obj.to_hash
    expected = generate_hash

    assert_equal expected, actual
  end
end
