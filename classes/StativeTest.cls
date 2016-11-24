@isTest
public class StativeTest {
    public static testMethod void testContracts(){
        Stative.addContract('x','y');
        System.assertEquals('y',Stative.getContractValue('x'));
        System.assert(Stative.contractExists('x'));
        Stative.deleteContract('x');
        System.assert(!Stative.contractExists('x'));
        Stative.addContract('x','y');
        System.assert(Stative.contractExists('x'));
		System.assertEquals('y',Stative.getContractValue('x'));
        Stative.updateContract('x', 'd');
		System.assertEquals('d',Stative.getContractValue('x'));        
        Stative.upsertContract('x', 'z');
        System.assertEquals('z',Stative.getContractValue('x'));        
    }
}