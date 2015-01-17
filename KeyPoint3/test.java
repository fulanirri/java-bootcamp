package KeyPoint3;


public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
                Building BigHospital = new Building.Builder(3, 1).kitchens(1).floors(1).waitrooms(1).diningrooms(1).dentalCenter(5).diagnosticCenter(5).floors(10).build();

		System.out.println(BigHospital);

		

	}

}
