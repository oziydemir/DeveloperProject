trigger PatientTrigger on Patient__c (after insert, after update, after undelete) {
    PatientTriggerHandler.patientSSNcontrol(trigger.New);
}