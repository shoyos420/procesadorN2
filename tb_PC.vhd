LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_PC IS
END tb_PC;
 
ARCHITECTURE behavior OF tb_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         clkFPGA : IN  std_logic;
         reset : IN  std_logic;
         nextInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal clkFPGA : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal nextInstruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkFPGA_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          address => address,
          clkFPGA => clkFPGA,
          reset => reset,
          nextInstruction => nextInstruction
        );

   -- Clock process definitions
   clkFPGA_process :process
   begin
		clkFPGA <= '0';
		wait for clkFPGA_period/2;
		clkFPGA <= '1';
		wait for clkFPGA_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		address <= x"09420000";
		
		wait for 100ns;
		
		reset <= '1';
		
		wait for 100 ns;
		reset <= '0';
		
		address <= x"00000001";
		
		wait for 100 ns;
		
		address <=x"00000010";
      -- insert stimulus here 

      wait;
   end process;

END;
