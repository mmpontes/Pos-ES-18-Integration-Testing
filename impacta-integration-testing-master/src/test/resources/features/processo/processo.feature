@execute
Feature: Process CRUD

  Background:
    Given user access to Process Page
    And user clicks on new process button

  Scenario: New Process Simple
    Given user types vara with value equal "191"
    And user types numero_processo with value equal "171"
    And user types natureza with value equal "Veracity of Life"
    And user types partes with value equal "Death x Life"
    And user types urgente with value equal "N"
    And user types arbitramento with value equal "N"
    And user types assistente_social with value equal "Catia"
    And user types data_entrada with value equal "2018-06-21"
    And user types data_saida with value equal "2020-06-14"
    And user types data_agendamento with value equal ""
    And user types status with value equal "Finished"
    And user types observacao with value equal "Life confirmed"
    When user clicks on save button
    Then user should see "save with success" message

  Scenario Outline: New Process
    Given user types vara with value equal "<valueVara>"
    And user types numero_processo with value equal "<valueNP>"
    And user types natureza with value equal "<valueNatureza>"
    And user types partes with value equal "<valuePartes>"
    And user types urgente with value equal "<valueUrgente>"
    And user types arbitramento with value equal "<valueArbitramento>"
    And user types assistente_social with value equal "<valueAS>"
    And user types data_entrada with value equal "<valueDE>"
    And user types data_saida with value equal "<valueDS>"
    And user types data_agendamento with value equal "<valueDG>"
    And user types status with value equal "<valueStatus>"
    And user types observacao with value equal "<valueObservacao>"
    When user clicks on save button
    Then user should see "<type>" message
    And  user should see vara with value "<valueVara>"
    And user should see numero_processo with value "<valueNP>"
    Examples:
      | valueVara | valueNP | valueNatureza | valuePartes         | valueUrgente | valueArbitramento | valueAS | valueDE    | valueDS | valueDG    | valueStatus | valueObservacao | type              |
      | 666       | 777     | Guarda        | Roberto x Cristiane | S            | S                 | Eliane  | 2018-11-22 |         |            | Aguardando  |                 | save with success |
      | 999       | 555     | Testamento    | Cidinei x Vera      | N            | S                 | Carlos  | 2018-11-22 |         | 2020-11-22 | Agendado    | Pendente        | save with success |


    Scenario: Update Process
      Given user types vara with value equal "1234"
      And user types numero_processo with value equal "2321"
      And user types natureza with value equal "Veracity of Death"
      And user types partes with value equal "Life x Death"
      And user types urgente with value equal "S"
      And user types arbitramento with value equal "S"
      And user types assistente_social with value equal "Zeus"
      And user types data_entrada with value equal "2018-06-21"
      And user types data_saida with value equal "2020-06-14"
      And user types data_agendamento with value equal "2020-06-01"
      And user types status with value equal "Finished"
      And user types observacao with value equal "Death confirmed"
      And the user clicks on save button
      When the field update status with value "Awaiting"
      And the user clicks on update button
      And user wants to see process information
      Then user should see "success" message
      And user should see status with value "Awaiting"

    Scenario: Delete Process
      Given user types vara with value equal "666"
      And user types numero_processo with value equal "999"
      And user types natureza with value equal "Veracity of Death"
      And user types partes with value equal "Life x Death"
      And user types urgente with value equal "S"
      And user types arbitramento with value equal "S"
      And user types assistente_social with value equal "Cida"
      And user types data_entrada with value equal "2018-06-21"
      And user types data_saida with value equal "2020-06-14"
      And user types data_agendamento with value equal "2020-06-01"
      And user types status with value equal "Finished"
      And user types observacao with value equal "Death confirmed"
      And the user clicks on save button
      When user clicks the delete button the process is deleted
      Then user should see "no content" message

  Scenario: Delete Process with non-existent id
    Given user types vara with value equal "666"
    And user types numero_processo with value equal "999"
    And user types natureza with value equal "Veracity of Death"
    And user types partes with value equal "Life x Death"
    And user types urgente with value equal "S"
    And user types arbitramento with value equal "S"
    And user types assistente_social with value equal "Cida"
    And user types data_entrada with value equal "2018-06-21"
    And user types data_saida with value equal "2020-06-14"
    And user types data_agendamento with value equal "2020-06-01"
    And user types status with value equal "Finished"
    And user types observacao with value equal "Death confirmed"
    And the user clicks on save button
    When the user clicks on delete button with invalid id
    Then user should see "not found" message