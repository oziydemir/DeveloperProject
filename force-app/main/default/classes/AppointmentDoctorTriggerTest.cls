@isTest
public class AppointmentDoctorTriggerTest {
   @isTest
        private static void triggerTest(){
            Clinic_Manager__c cm=new Clinic_Manager__c();
            cm.Phone__c='111111111';
            cm.Name='Test Manager';
            cm.Email__c='testManager@gma.com';
            insert cm;
            
            Appointment__c appo=new Appointment__c();
            appo.Name__c='Surgery';
            appo.Live__c=true;
            appo.Start_Date_Time__c=Date.newInstance(2022, 11, 2);
            appo.End_Date_Time__c=Date.newInstance(2022, 11, 4);
            appo.Maximum_number_of_patients__c=10;
            appo.Clinic_Manager__c=cm.Id;
            insert appo;

            Doctor__c doc=new Doctor__c();
            doc.Name='Test Doc';
            doc.Phone__c='123123123';
            doc.Email__c='testdoc@gma.com';
            insert doc;

            Appointment_Doctor__c newAppDoc=new Appointment_Doctor__c();
            newAppDoc.Doctor__c=doc.Id;
            newAppDoc.Appointment__c=appo.Id;
            insert newAppDoc;
        }
}
