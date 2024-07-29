# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
{ jdk ? "jdk8" }:

let
  # get a normalized set of packages, from which
  # we will install all the needed dependencies
  pkgs = import ./pkgs.nix { inherit jdk; };
in
  pkgs.mkShell {
    buildInputs = [
      pkgs.${jdk}
      pkgs.jdk8
      pkgs.jdk11
      pkgs.jq
      pkgs.maven
    ];
    JAVA_16_HOME = "${pkgs.jdk16}/lib/openjdk";
    JAVA_11_HOME = "${pkgs.jdk11}/lib/openjdk";
    JAVA_8_HOME  = "${pkgs.jdk8}/lib/openjdk";  
    shellHook = ''
      export NIX_ENV=dev
    '';
  }

