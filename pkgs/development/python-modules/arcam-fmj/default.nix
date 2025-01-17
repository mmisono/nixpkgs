{ lib
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, aiohttp
, attrs
, defusedxml
, pytest-aiohttp
, pytest-mock
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "arcam-fmj";
  version = "1.1.0";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "elupus";
    repo = "arcam_fmj";
    rev = "refs/tags/${version}";
    hash = "sha256-oXMoDpb4tg4iYAanTfPzeFp/IQl4bIELCTdM24hM84A=";
  };

  propagatedBuildInputs = [
    aiohttp
    attrs
    defusedxml
  ];

  nativeCheckInputs = [
    pytest-aiohttp
    pytest-mock
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "arcam.fmj"
    "arcam.fmj.client"
    "arcam.fmj.state"
    "arcam.fmj.utils"
  ];

  meta = with lib; {
    description = "Python library for speaking to Arcam receivers";
    homepage = "https://github.com/elupus/arcam_fmj";
    changelog = "https://github.com/elupus/arcam_fmj/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ dotlambda ];
  };
}
