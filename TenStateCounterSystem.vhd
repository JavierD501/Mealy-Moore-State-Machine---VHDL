----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2020 02:06:02 PM
-- Design Name: 
-- Module Name: TSCS - Behavioral
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

entity TSCS is
    Port ( Clk, Reset, UP : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (7 downto 0);
           A : out STD_LOGIC_VECTOR (7 downto 0));
end TSCS;

architecture Behavioral of TSCS is
component FD is
    Port ( Clk, Reset : in STD_LOGIC;
           Slow_Clk : out STD_LOGIC);
end component;

component TSC is
    Port ( UP, Clk, Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           DIR_UP : out STD_LOGIC);
end component;

component DDD is
    Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (6 downto 0);
           EN_DSP : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Slow_Clk, DIR_UP: std_logic := '0';
signal Q: std_logic_vector(3 downto 0):="0000";
signal display: std_logic_vector(6 downto 0):= (others => '0');
begin
Frequency_Divider: FD port map (Clk=> Clk, Reset => Reset,Slow_Clk => Slow_Clk);
Ten_State_Counter: TSC port map (Clk =>Slow_Clk, Reset=> Reset, UP => UP,Q => Q,DIR_UP=> DIR_UP);
Binary_7_Segment: DDD port map (S => Q, D => display, EN_DSP=> A(3 downto 0));
A(7 downto 4) <="1111";
D <= DIR_UP & display;
end Behavioral;
