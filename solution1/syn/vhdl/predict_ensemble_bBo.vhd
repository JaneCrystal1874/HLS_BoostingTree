-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bBo_rom is 
    generic(
             DWIDTH     : integer := 8; 
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


architecture rtl of predict_ensemble_bBo_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000111", 6 => "00001001", 7 => "00001011", 
    8 to 9=> "00000000", 10 => "00001101", 11 => "00000000", 12 => "00001111", 
    13 => "00000000", 14 => "00010001", 15 => "00000000", 16 => "00010011", 
    17 => "00000000", 18 => "00010101", 19 to 20=> "00000000", 21 => "00010111", 
    22 => "00011001", 23 to 24=> "00000000", 25 => "00011011", 26 => "00011101", 
    27 to 29=> "00000000", 30 => "00011111", 31 => "00100001", 32 => "00000000", 
    33 => "00100011", 34 => "00000000", 35 => "00100101", 36 => "00100111", 
    37 => "00101001", 38 => "00101011", 39 to 43=> "00000000", 44 => "00101101", 
    45 => "00000000", 46 => "00101111", 47 => "00110001", 48 => "00110011", 
    49 => "00000000", 50 => "00110101", 51 => "00110111", 52 => "00111001", 
    53 to 54=> "00000000", 55 => "00111011", 56 to 59=> "00000000", 60 => "00111101", 
    61 => "00111111", 62 => "00000000", 63 => "01000001", 64 => "01000011", 
    65 => "01000101", 66 => "01000111", 67 to 68=> "00000000", 69 => "01001001", 
    70 => "00000000", 71 => "01001011", 72 => "01001101", 73 => "01001111", 
    74 => "01010001", 75 to 77=> "00000000", 78 => "01010011", 79 to 82=> "00000000", 
    83 => "01010101", 84 => "01010111", 85 => "00000000", 86 => "01011001", 
    87 => "00000000", 88 => "01011011", 89 to 90=> "00000000", 91 => "01011101", 
    92 => "01011111", 93 => "01100001", 94 to 96=> "00000000", 97 => "01100011", 
    98 => "01100101", 99 => "01100111", 100 => "01101001", 101 => "01101011", 
    102 => "01101101", 103 to 105=> "00000000", 106 => "01101111", 107 => "00000000", 
    108 => "01110001", 109 => "01110011", 110 => "01110101", 111 => "01110111", 
    112 to 113=> "00000000", 114 => "01111001", 115 to 116=> "00000000", 117 => "01111011", 
    118 => "01111101", 119 => "01111111", 120 to 122=> "00000000", 123 => "10000001", 
    124 => "10000011", 125 => "00000000", 126 => "10000101", 127 => "10000111", 
    128 => "00000000", 129 => "10001001", 130 => "10001011", 131 => "10001101", 
    132 => "10001111", 133 => "10010001", 134 => "00000000", 135 => "10010011", 
    136 => "00000000", 137 => "10010101", 138 => "10010111", 139 to 142=> "00000000", 
    143 => "10011001", 144 => "10011011", 145 => "10011101", 146 to 147=> "00000000", 
    148 => "10011111", 149 => "10100001", 150 to 151=> "00000000", 152 => "10100011", 
    153 => "10100101", 154 to 155=> "00000000", 156 => "10100111", 157 => "00000000", 
    158 => "10101001", 159 => "10101011", 160 => "00000000", 161 => "10101101", 
    162 to 164=> "00000000", 165 => "10101111", 166 to 170=> "00000000", 171 => "10110001", 
    172 => "00000000", 173 => "10110011", 174 => "10110101", 175 => "10110111", 
    176 => "10111001", 177 => "10111011", 178 => "00000000", 179 => "10111101", 
    180 => "00000000", 181 => "10111111", 182 to 194=> "00000000" );


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

entity predict_ensemble_bBo is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bBo is
    component predict_ensemble_bBo_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bBo_rom_U :  component predict_ensemble_bBo_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


