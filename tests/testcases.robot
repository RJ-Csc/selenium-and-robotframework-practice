*** Settings ***
Documentation   Test suite practice
Library   SeleniumLibrary

*** Test Cases ***
Successful user log in
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Input Text  user-name  standard_user
  Input Password  password  secret_sauce
  Click Button  login-button
  Element Text Should Be  class:title   PRODUCTS
  [Teardown]  Close Browser

Unsuccessful user log in by a locked out user
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Input Text  user-name  locked_out_user
  Input Password  password  secret_sauce
  Click Button  login-button
  Page Should Contain element  class:error
  [Teardown]  Close Browser

Typed wrong password
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Input Text  user-name  standard_user
  Input Password  password  secretsauce
  Click Button  login-button
  Page Should Contain element  class:error
  [Teardown]  Close Browser

Logged in as problem user and sees a broken inventory page
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Input Text  user-name  problem_user
  Input Password  password  secret_sauce
  Click Button  login-button
  Page Should Contain Image   css:img[src="/static/media/sl-404.168b1cce.jpg"]
  [Teardown]  Close Browser

Sort product name (A to Z)
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Input Text  user-name  standard_user
  Input Password  password  secret_sauce
  Click Button  login-button
  Select From List By Value   css=*[data-test="product_sort_container"]   az
  List Selection Should Be   css=*[data-test="product_sort_container"]   az
  [Teardown]  Close Browser

Sort product name (Z to A)
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Input Text  user-name  standard_user
  Input Password  password  secret_sauce
  Click Button  login-button
  Select From List By Value   css=*[data-test="product_sort_container"]   za
  List Selection Should Be   css=*[data-test="product_sort_container"]   za
  [Teardown]  Close Browser

Sort product price (low to high)
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Input Text  user-name  standard_user
  Input Password  password  secret_sauce
  Click Button  login-button
  Select From List By Value   css=*[data-test="product_sort_container"]   lohi
  List Selection Should Be   css=*[data-test="product_sort_container"]   lohi
  [Teardown]  Close Browser

Sort product price (high to low)
  Open Browser  https://www.saucedemo.com/  chrome
  Maximize Browser Window
  Input Text  user-name  standard_user
  Input Password  password  secret_sauce
  Click Button  login-button
  Select From List By Value   css=*[data-test="product_sort_container"]   hilo
  List Selection Should Be   css=*[data-test="product_sort_container"]   hilo
  [Teardown]  Close Browser
