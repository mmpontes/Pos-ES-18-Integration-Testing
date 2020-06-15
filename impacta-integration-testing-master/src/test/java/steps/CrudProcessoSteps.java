package steps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import definition.Processo;
import support.RESTSupport;

public class CrudProcessoSteps {
    @Given("^user access to Process Page$")
    public void userAccessToProcessPage() {
        Processo.clearfields();
    }

    @Given("^user clicks on new process button$")
    public void userClicksOnNewProcessButton() {
        
    }

    @And("^user types (.*) with value equal \"([^\"]*)\"$")
    public void userTypesVaraWithValueEqual(String field, String value) throws Throwable {
        Processo.addFields(field,value);
    }

    @When("^user clicks on save button$")
    public void userClicksOnSaveButton() throws Throwable {
        RESTSupport.executePost(Processo.getEndPoint(),Processo.getFields());
        Processo.setLastProcess(RESTSupport.key("id").toString());
        Processo.clearfields();
    }

    @And("^the user clicks on save button$")
    public void theUserClicksOnSaveButton() {
        RESTSupport.executePost(Processo.getEndPoint(),Processo.getFields());
        Processo.setLastProcess(RESTSupport.key("id").toString());
    }

    @And("^the user update \"([^\"]*)\" with value \"([^\"]*)\"$")
    public void theUserUpdateWithValue(String field, String value) throws Throwable {
        Processo.addFields(field, value);
    }

    @When("^the user clicks on update button$")
    public void theUserClicksOnUpdateButton() {
        RESTSupport.executePut(Processo.getEndPoint() + "/" + Processo.getLastProcess() + ".json", Processo.getFields());
    }

    @And("^user wants to see process information$")
    public void userWantsToSeeProcessInformation() {
        RESTSupport.executeGet(Processo.getEndPoint() + "/" + Processo.getLastProcess() + ".json");
    }

    @And("^the field update (.*) with value \"([^\"]*)\"$")
    public void theFieldUpdateStatusWithValue(String field, String value) throws Throwable {
        Processo.addFields(field,value);
    }

    @When("^user clicks the delete button the process is deleted$")
    public void userClicksTheDeleteButtonTheProcessIsDeleted() {
        RESTSupport.executeDelete(Processo.getEndPoint() + "/" + Processo.getLastProcess() + ".json");
    }

    @When("^the user clicks on delete button with invalid id$")
    public void theUserClicksOnDeleteButtonWithInvalidId() {
        RESTSupport.executeDelete(Processo.getEndPoint() + "/999999999999999.json");
    }
}
