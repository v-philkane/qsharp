    namespace Kata.Verification {
        
        open Microsoft.Quantum.Math;
        open Microsoft.Quantum.Random;    
        

        @EntryPoint()
        operation CheckSolution() : Bool {
        
            mutable success = false;
            mutable expected = Complex(0., 0.); 
            mutable actual = Complex(0., 0.);  

            mutable count = 0;

            repeat {
                let testx = ComplexRandom(1., 100.); 
                let testy = ComplexRandom(1., 100.);

                set expected = ComplexMult_Reference(testx, testy); 
                set actual = Kata.ComplexMult(testx, testy);        
        
                if (ComplexEqual(expected, actual)) {
                    set success = true; 
                }                

                set count += 1;
            }
            until (count > 25) or (success == false);

            if success == true {Message("Correct!");}
            else {
                     Message("Incorrect. Actual value doesn't match expected value");
                     Message($"Actual value: {actual::Real} + {actual::Imag}i. Expected value: {expected::Real} +  {expected::Imag}i");
                }         
        
            return (success);
        
        }
    }