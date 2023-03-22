----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2020 01:55:49 PM
-- Design Name: 
-- Module Name: DDD - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DDD is
    Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (6 downto 0);
           EN_DSP : out STD_LOGIC_VECTOR (3 downto 0));
end DDD;

architecture Behavioral of DDD is

signal W: std_logic:='0';
signal X: std_logic:='0';
signal Y: std_logic:='0';
signal Z: std_logic:='0';

begin
EN_DSP <= "1110";
---- Paste your Binary to Seven Segment Code Below
W <= S(0);
X <= S(1);
Y <= S(2);
Z <= S(3);

D(0) <= (not(W) and X and not(Y) and not(Z)) or (not(W) and not(X) and not(Y) and Z) or (W and X and not(Y) and Z) or (W and not(X) and Y and Z);
D(1) <= (W and X and not(Z)) or (not(W) and X and not(Y) and Z) or (W and Y and Z) or (X and Y and not(Z));
D(2) <= (W and X and Y) or (W and X and not(Y) and not(Z)) or (not(W) and not(X) and Y and not(Z));
D(3) <= (not(W) and X and not(Y) and not(Z)) or (not(W) and not(X) and not(Y) and Z) or (X and Y and Z) or (W and not(X) and Y and not(Z));
D(4) <= (not(W) and X and not(Y)) or (not(X) and not(Y) and Z) or (not(W) and Y and Z);
D(5) <= (not(W) and not(X) and Z) or (not(W) and Y and Z) or (not(W) and not(X) and Y) or (W and X and not(Y) and Z);
D(6) <= (not(W) and not(X) and not(Y)) or (W and X and not(Y) and not(Z)) or (not(W) and X and Y and Z);
--D(7) <= '1';

end Behavioral;
