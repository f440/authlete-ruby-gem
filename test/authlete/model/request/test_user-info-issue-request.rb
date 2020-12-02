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


class UserInfoIssueRequestTest < Minitest::Test
  TOKEN  = '<token>'
  CLAIMS = [ 'claim0', 'claim1' ]
  SUB    = '<sub>'


  def set_params(obj)
    obj.token  = TOKEN
    obj.claims = CLAIMS
    obj.sub    = SUB
  end


  def match(obj)
    assert_equal TOKEN,  obj.token
    assert_equal CLAIMS, obj.claims
    assert_equal SUB,    obj.sub
  end


  def generate_hash
    {
      token:  '<token>',
      claims: [ 'claim0', 'claim1' ],
      sub:    '<sub>'
    }
  end


  def test_setters
    actual = Authlete::Model::Request::UserInfoIssueRequest.new
    set_params(actual)

    match(actual)
  end


  def test_to_hash
    obj = Authlete::Model::Request::UserInfoIssueRequest.new
    set_params(obj)
    actual   = obj.to_hash
    expected = generate_hash

    assert_equal expected, actual
  end
end
