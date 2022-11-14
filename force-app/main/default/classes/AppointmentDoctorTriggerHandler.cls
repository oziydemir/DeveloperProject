public class AppointmentDoctorTriggerHandler {
    public static void duplicateBookingError(list<Appointment_Doctor__c> triggerNew,list<Appointment_Doctor__c> triggerOld, Map<id,Appointment_Doctor__c> triggerNewMap,Map<id,Appointment_Doctor__c> triggerOldMap){
        try {
            Map<String,Appointment_Doctor__c> appointmentDoctorMap= new Map<String,Appointment_Doctor__c>();
        Set<Id> newDoctorsIds=new Set<Id>();
        Set<Id> newAppointmentIds=new Set<Id>();

        for (Appointment_Doctor__c rec : triggerNew) {
            newDoctorsIds.add(rec.Doctor__c);
            newAppointmentIds.add(rec.Appointment__c);

            String myKey= string.valueOf(rec.Doctor__c) + string.valueOf(rec.Appointment__c);
            appointmentDoctorMap.put(myKey,rec);

        List<Appointment_Doctor__c> existingRec=[SELECT Id,Doctor__c,Appointment__c FROM Appointment_Doctor__c WHERE Doctor__c IN : newDoctorsIds AND Appointment__c IN : newAppointmentIds];

        for (Appointment_Doctor__c eachRec : existingRec) {
            string systemKey=string.valueOf(eachRec.Doctor__c) + string.valueOf(eachRec.Appointment__c);
            Appointment_Doctor__c toBeFail=appointmentDoctorMap.get(systemKey);
                if (toBeFail!=null) {
                    toBeFail.addError('This is a duplicate record.');
                }
            }
        }
            
        } catch (Exception exc) {
            ErrorLogCreator.ErrorLog('Duplicating Records', exc.getMessage());
        }
        
    }   
}