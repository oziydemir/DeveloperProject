public class DeleteAppoinmetsSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        Database.executeBatch(new DeleteTwoMonthsAppointments(), 500);
    }

    
}
