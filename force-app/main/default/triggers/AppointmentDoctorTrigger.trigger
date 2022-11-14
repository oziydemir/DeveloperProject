trigger AppointmentDoctorTrigger on Appointment_Doctor__c (before insert,before update) {
if (trigger.isBefore) {

    if (trigger.isInsert || trigger.isUpdate) {
            AppointmentDoctorTriggerHandler.duplicateBookingError(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
        }
    }
}