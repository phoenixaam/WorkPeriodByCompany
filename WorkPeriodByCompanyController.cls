public with sharing class WorkPeriodByCompanyController {

    public Integer companiesCount {set; get;}
    public List<Work_Period__c> workPeriods {set; get;}
    public Set<String> companies {set; get;}


    public WorkPeriodByCompanyController(){
        workPeriods = [
                SELECT Id, Name, Order__r.Name, Order__r.Account__r.Name,
                        Rate__r.Name, Rate__r.Customer_Rate__c, Rate__r.Employer_Rate__c
                FROM Work_Period__c
        ];
        companies = new Set<String>();
        for(Work_Period__c period: workPeriods){
            String company = period.Order__r.Account__r.Name ;
            companies.add(company);
        }
        companiesCount = companies.size();
    }
}
