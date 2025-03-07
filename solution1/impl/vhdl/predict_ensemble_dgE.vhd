-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dgE_rom is 
    generic(
             DWIDTH     : integer := 4; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_dgE_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0000", 4 => "1011", 
    5 => "1010", 6 => "1000", 7 to 8=> "0000", 9 to 11=> "0101", 12 to 14=> "0000", 
    15 => "0101", 16 => "0000", 17 => "1000", 18 => "1010", 19 to 20=> "0000", 
    21 => "1010", 22 => "0000", 23 => "0011", 24 to 25=> "0000", 26 => "0011", 
    27 => "1100", 28 => "1011", 29 => "0010", 30 to 31=> "0000", 32 => "0111", 
    33 to 34=> "0000", 35 => "1001", 36 => "0010", 37 => "0100", 38 to 39=> "0000", 
    40 => "0001", 41 => "1010", 42 to 44=> "0000", 45 => "1011", 46 => "0101", 
    47 => "0000", 48 => "0011", 49 to 50=> "0000", 51 => "1010", 52 => "1001", 
    53 => "0010", 54 to 55=> "1010", 56 to 58=> "0000", 59 => "1101", 60 => "0001", 
    61 to 63=> "0000", 64 => "0111", 65 to 66=> "0000", 67 => "1001", 68 => "0100", 
    69 => "1011", 70 to 71=> "0000", 72 => "1010", 73 to 75=> "0000", 76 => "1001", 
    77 => "0000", 78 => "0111", 79 => "1011", 80 to 81=> "0000", 82 to 83=> "1000", 
    84 => "0000", 85 => "1001", 86 => "0000", 87 => "1001", 88 => "0110", 
    89 => "0001", 90 => "0000", 91 => "1100", 92 to 93=> "0000", 94 => "0011", 
    95 => "1100", 96 to 97=> "0000", 98 => "0001", 99 => "1100", 100 => "0010", 
    101 to 102=> "0000", 103 => "0100", 104 => "0000", 105 => "1100", 106 to 107=> "0000", 
    108 => "0101", 109 => "1000", 110 => "0101", 111 to 114=> "0000", 115 => "0101", 
    116 => "0000", 117 => "1011", 118 => "0000", 119 => "1011", 120 => "0111", 
    121 => "1100", 122 => "0001", 123 => "0000", 124 => "0011", 125 to 128=> "0000", 
    129 => "0011", 130 => "0100", 131 to 132=> "0000", 133 => "1000", 134 => "0100", 
    135 => "0101", 136 to 138=> "0000", 139 => "1100", 140 => "0100", 141 => "1000", 
    142 => "0010", 143 => "0100", 144 => "0011", 145 => "0000", 146 => "1010", 
    147 => "0101", 148 => "0000", 149 => "0110", 150 to 153=> "0000", 154 => "1100", 
    155 to 158=> "0000", 159 => "0111", 160 => "0001", 161 => "1010", 162 => "1001", 
    163 => "0000", 164 => "0001", 165 to 166=> "0000", 167 => "1010", 168 => "0010", 
    169 to 172=> "0000", 173 => "1100", 174 to 175=> "0000", 176 => "1000", 177 => "0000", 
    178 => "1000", 179 => "0000", 180 => "1100", 181 => "0110", 182 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_dgE is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_dgE is
    component predict_ensemble_dgE_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dgE_rom_U :  component predict_ensemble_dgE_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


