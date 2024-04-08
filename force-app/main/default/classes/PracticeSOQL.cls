/**
 * @description       : 
 * @author            : RISHAB GOYAL
 * @group             : 
 * @last modified on  : 04-08-2024
 * @last modified by  : RISHAB GOYAL
**/
public with sharing class PracticeSOQL {
    public static void PracticeSOQL() {
        List<Account> accounts = [SELECT Id, Name, (SELECT Id, LastName FROM Contacts) FROM Account LIMIT 1];
        for (Account a : accounts) {
            System.debug('Account Name: ' + a.Name);
            for (Contact c : a.Contacts) {
                System.debug('Contact Last Name: ' + c.LastName);
            }
        }   
    }
    

    public static Contact queryContactByEmailAddress(String email) {
        Contact c = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = :email LIMIT 1];
        return c;
    }
}