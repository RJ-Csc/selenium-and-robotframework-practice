*** Settings ***
Documentation test
...
...
...
Library SeleniumLibrary

*** Test Cases ***
Valid Login
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Page Should Contain Element login-button
  Input Text  user-name standard_user
  Input Password  password secret_sauce
  Click Button  login-button
  Element Text Should Be  class:title Products
  [Teardown]  Close Browser
