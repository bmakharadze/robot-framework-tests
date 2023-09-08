*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${frame}                frame1
${text}                 sampleHeading

*** Keywords ***
Perform Actions in Frame
    Select Frame        id="${frame}"
    Get Text            id= ${text}

