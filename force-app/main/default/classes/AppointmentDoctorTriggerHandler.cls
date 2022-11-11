public class AppointmentDoctorTriggerHandler {
    public static void duplicateBookingError(list<Appointment_Doctor__c> triggerNew,list<Appointment_Doctor__c> triggerOld, Map<id,Appointment_Doctor__c> triggerNewMap,Map<id,Appointment_Doctor__c> triggerOldMap){
        
        Set<Id> existingDocIds=new Set<Id>();
        Set<Id> existingAppointmentIds=new Set<Id>();
        
        Set<Id> newDoctorsIds=new Set<Id>();
        Set<Id> newAppointmentIds=new Set<Id>();

        List<Appointment_Doctor__c> existingRec=[SELECT Id,Doctor__c,Appointment__c FROM Appointment_Doctor__c];

        for (Appointment_Doctor__c eachRec : existingRec) {
            existingDocIds.add(eachRec.Doctor__c);
            existingAppointmentIds.add(eachRec.Appointment__c);
        }

        for (Appointment_Doctor__c rec : triggerNew) {
            newDoctorsIds.add(rec.Doctor__c);
            newAppointmentIds.add(rec.Appointment__c);
        }
               
            if (triggerOld==null) {
                for (Appointment_Doctor__c eachAD : triggerNew) {
                    if (existingDocIds.contains(eachAD.Doctor__c) && existingAppointmentIds.contains(eachAD.Appointment__c)) {
                        eachAD.addError('Found a duplicate doctor record in system with '+eachAD.Doctor__c);
                    }
                }
            } else if (triggerOld!=null) {
                
            }
        
        

        
        

    }
}

/*List<Doctor__c> allDoctors=[SELECT Id,Name FROM Doctor__c];

for (Doctor__c eachDoc : allDoctors) {
    newDoctorsIds.add(eachDoc.Id);
}

for (Appointment_Doctor__c eachRec : existingRec) {
    existingDocIds.add(eachRec.Doctor__c);
}


for (Appointment_Doctor__c eachNew : triggerNew) {
    if (existingDocIds.contains(eachNew.Doctor__c)) {
        eachNew.addError('Found a duplicate doctor record in system with '+eachNew.Doctor__c);
    } 
}*/


