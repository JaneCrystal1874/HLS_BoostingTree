-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cpw_rom is 
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


architecture rtl of predict_ensemble_cpw_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000000", 6 => "00000111", 7 => "00001001", 
    8 => "00000000", 9 => "00001011", 10 => "00001101", 11 to 12=> "00000000", 
    13 => "00001111", 14 => "00010001", 15 => "00000000", 16 => "00010011", 
    17 => "00010101", 18 to 20=> "00000000", 21 => "00010111", 22 => "00011001", 
    23 => "00011011", 24 to 26=> "00000000", 27 => "00011101", 28 => "00011111", 
    29 to 30=> "00000000", 31 => "00100001", 32 => "00100011", 33 => "00000000", 
    34 => "00100101", 35 => "00000000", 36 => "00100111", 37 => "00101001", 
    38 => "00000000", 39 => "00101011", 40 => "00101101", 41 => "00101111", 
    42 to 43=> "00000000", 44 => "00110001", 45 to 46=> "00000000", 47 => "00110011", 
    48 to 49=> "00000000", 50 => "00110101", 51 => "00110111", 52 => "00111001", 
    53 => "00000000", 54 => "00111011", 55 => "00111101", 56 => "00000000", 
    57 => "00111111", 58 => "01000001", 59 => "01000011", 60 => "01000101", 
    61 to 63=> "00000000", 64 => "01000111", 65 => "00000000", 66 => "01001001", 
    67 to 68=> "00000000", 69 => "01001011", 70 to 73=> "00000000", 74 => "01001101", 
    75 => "01001111", 76 => "01010001", 77 => "01010011", 78 => "00000000", 
    79 => "01010101", 80 to 81=> "00000000", 82 => "01010111", 83 => "01011001", 
    84 => "00000000", 85 => "01011011", 86 to 88=> "00000000", 89 => "01011101", 
    90 => "00000000", 91 => "01011111", 92 => "00000000", 93 => "01100001", 
    94 => "01100011", 95 => "01100101", 96 => "01100111", 97 => "01101001", 
    98 to 103=> "00000000", 104 => "01101011", 105 to 107=> "00000000", 108 => "01101101", 
    109 => "01101111", 110 => "01110001", 111 to 113=> "00000000", 114 => "01110011", 
    115 => "00000000", 116 => "01110101", 117 => "00000000", 118 => "01110111", 
    119 => "01111001", 120 => "01111011", 121 => "01111101", 122 => "00000000", 
    123 => "01111111", 124 => "00000000", 125 => "10000001", 126 => "10000011", 
    127 => "00000000", 128 => "10000101", 129 => "10000111", 130 => "00000000", 
    131 => "10001001", 132 to 133=> "00000000", 134 => "10001011", 135 to 136=> "00000000", 
    137 => "10001101", 138 => "10001111", 139 to 140=> "00000000", 141 => "10010001", 
    142 => "10010011", 143 => "10010101", 144 => "00000000", 145 => "10010111", 
    146 => "10011001", 147 => "10011011", 148 to 149=> "00000000", 150 => "10011101", 
    151 => "10011111", 152 => "10100001", 153 to 154=> "00000000", 155 => "10100011", 
    156 => "10100101", 157 => "00000000", 158 => "10100111", 159 => "10101001", 
    160 => "10101011", 161 to 162=> "00000000", 163 => "10101101", 164 => "00000000", 
    165 => "10101111", 166 to 167=> "00000000", 168 => "10110001", 169 to 172=> "00000000", 
    173 => "10110011", 174 => "10110101", 175 => "00000000", 176 => "10110111", 
    177 => "00000000", 178 => "10111001", 179 => "10111011", 180 to 183=> "00000000", 
    184 => "10111101", 185 to 194=> "00000000" );


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

entity predict_ensemble_cpw is
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

architecture arch of predict_ensemble_cpw is
    component predict_ensemble_cpw_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cpw_rom_U :  component predict_ensemble_cpw_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


