-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dnG_rom is 
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


architecture rtl of predict_ensemble_dnG_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00000000", 
    8 => "00001011", 9 to 10=> "00000000", 11 => "00001101", 12 => "00001111", 
    13 => "00010001", 14 => "00010011", 15 to 19=> "00000000", 20 => "00010101", 
    21 => "00000000", 22 => "00010111", 23 => "00011001", 24 => "00000000", 
    25 => "00011011", 26 to 27=> "00000000", 28 => "00011101", 29 => "00011111", 
    30 => "00100001", 31 => "00100011", 32 => "00000000", 33 => "00100101", 
    34 => "00000000", 35 => "00100111", 36 => "00101001", 37 to 38=> "00000000", 
    39 => "00101011", 40 to 41=> "00000000", 42 => "00101101", 43 => "00101111", 
    44 to 47=> "00000000", 48 => "00110001", 49 => "00000000", 50 => "00110011", 
    51 => "00000000", 52 => "00110101", 53 => "00000000", 54 => "00110111", 
    55 => "00111001", 56 => "00000000", 57 => "00111011", 58 => "00111101", 
    59 => "00111111", 60 to 61=> "00000000", 62 => "01000001", 63 to 64=> "00000000", 
    65 => "01000011", 66 => "01000101", 67 to 69=> "00000000", 70 => "01000111", 
    71 => "00000000", 72 => "01001001", 73 => "01001011", 74 => "01001101", 
    75 => "01001111", 76 => "00000000", 77 => "01010001", 78 => "00000000", 
    79 => "01010011", 80 => "01010101", 81 => "01010111", 82 => "01011001", 
    83 => "01011011", 84 to 85=> "00000000", 86 => "01011101", 87 => "00000000", 
    88 => "01011111", 89 => "01100001", 90 => "01100011", 91 => "00000000", 
    92 => "01100101", 93 => "01100111", 94 => "00000000", 95 => "01101001", 
    96 to 99=> "00000000", 100 => "01101011", 101 => "01101101", 102 => "01101111", 
    103 => "01110001", 104 to 106=> "00000000", 107 => "01110011", 108 => "00000000", 
    109 => "01110101", 110 to 111=> "00000000", 112 => "01110111", 113 => "00000000", 
    114 => "01111001", 115 => "01111011", 116 => "01111101", 117 => "01111111", 
    118 => "10000001", 119 => "00000000", 120 => "10000011", 121 to 125=> "00000000", 
    126 => "10000101", 127 => "10000111", 128 => "00000000", 129 => "10001001", 
    130 => "10001011", 131 to 132=> "00000000", 133 => "10001101", 134 to 139=> "00000000", 
    140 => "10001111", 141 => "10010001", 142 => "10010011", 143 => "10010101", 
    144 to 147=> "00000000", 148 => "10010111", 149 => "00000000", 150 => "10011001", 
    151 => "10011011", 152 => "10011101", 153 to 156=> "00000000", 157 => "10011111", 
    158 => "10100001", 159 => "10100011", 160 => "10100101", 161 => "00000000", 
    162 => "10100111", 163 to 164=> "00000000", 165 => "10101001", 166 => "10101011", 
    167 to 168=> "00000000", 169 => "10101101", 170 to 171=> "00000000", 172 => "10101111", 
    173 to 175=> "00000000", 176 => "10110001", 177 to 194=> "00000000" );


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

entity predict_ensemble_dnG is
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

architecture arch of predict_ensemble_dnG is
    component predict_ensemble_dnG_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dnG_rom_U :  component predict_ensemble_dnG_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


