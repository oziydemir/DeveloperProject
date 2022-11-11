public class PatientTriggerHandler {        
    public static void patientSSNcontrol(List<Patient__c> triggerNew){
        for (Patient__c eachPat : triggerNew) {
            if (eachPat.Social_Security_Number__c.length()<=11) {
                PatientErrorLog.patientError(eachPat.Id , eachPat.CreatedDate);
            }
        }
    }
    
    
}
