class Prime {

    static boolean prime(int num) {
        if(num < 2)
            return false;
        if(num == 2)
            return true;
        if(num%2 == 0)
            return false;

        for(int i = 3; i<(num/2); i += 2) {
            if(num%i == 0)
                return false;
        }

        return true;
    }


    static int yieldprime(int target) {
        int count = 1;
        int primes = 2;
        while(true) {
            if(count == target)
                return primes;
            primes++;
            if(prime(primes))
                count++;
        }
    }


    public static void main(String[] argv) {
        long start = System.nanoTime();
        int prime = yieldprime(Integer.parseInt(argv[0]));
        System.out.println("Taken " +
        (System.nanoTime()-start)/1000000000.0 + " seconds to fetch");
        System.out.println(prime);
    }
}
