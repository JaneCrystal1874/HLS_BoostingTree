-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bhl_rom is 
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


architecture rtl of predict_ensemble_bhl_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 to 7=> "00000000", 8 => "00001001", 9 => "00001011", 
    10 => "00001101", 11 => "00000000", 12 => "00001111", 13 => "00010001", 
    14 => "00010011", 15 to 19=> "00000000", 20 => "00010101", 21 => "00010111", 
    22 => "00011001", 23 to 24=> "00000000", 25 => "00011011", 26 => "00011101", 
    27 => "00011111", 28 => "00000000", 29 => "00100001", 30 => "00100011", 
    31 => "00100101", 32 to 34=> "00000000", 35 => "00100111", 36 to 37=> "00000000", 
    38 => "00101001", 39 => "00101011", 40 => "00101101", 41 to 42=> "00000000", 
    43 => "00101111", 44 => "00000000", 45 => "00110001", 46 to 47=> "00000000", 
    48 => "00110011", 49 => "00110101", 50 to 51=> "00000000", 52 => "00110111", 
    53 => "00111001", 54 => "00111011", 55 => "00000000", 56 => "00111101", 
    57 => "00000000", 58 => "00111111", 59 => "00000000", 60 => "01000001", 
    61 => "01000011", 62 to 65=> "00000000", 66 => "01000101", 67 => "00000000", 
    68 => "01000111", 69 => "01001001", 70 => "01001011", 71 => "01001101", 
    72 to 75=> "00000000", 76 => "01001111", 77 => "01010001", 78 => "01010011", 
    79 => "01010101", 80 => "01010111", 81 to 82=> "00000000", 83 => "01011001", 
    84 => "01011011", 85 to 86=> "00000000", 87 => "01011101", 88 => "01011111", 
    89 to 92=> "00000000", 93 => "01100001", 94 => "01100011", 95 => "01100101", 
    96 => "00000000", 97 => "01100111", 98 => "01101001", 99 to 100=> "00000000", 
    101 => "01101011", 102 => "01101101", 103 to 104=> "00000000", 105 => "01101111", 
    106 => "01110001", 107 => "01110011", 108 to 109=> "00000000", 110 => "01110101", 
    111 => "01110111", 112 => "01111001", 113 => "01111011", 114 => "01111101", 
    115 => "01111111", 116 => "10000001", 117 => "10000011", 118 => "00000000", 
    119 => "10000101", 120 => "00000000", 121 => "10000111", 122 => "00000000", 
    123 => "10001001", 124 => "10001011", 125 => "10001101", 126 => "10001111", 
    127 => "00000000", 128 => "10010001", 129 => "00000000", 130 => "10010011", 
    131 => "10010101", 132 => "00000000", 133 => "10010111", 134 => "10011001", 
    135 to 137=> "00000000", 138 => "10011011", 139 => "10011101", 140 => "10011111", 
    141 => "10100001", 142 => "10100011", 143 => "00000000", 144 => "10100101", 
    145 => "10100111", 146 to 148=> "00000000", 149 => "10101001", 150 to 153=> "00000000", 
    154 => "10101011", 155 to 160=> "00000000", 161 => "10101101", 162 => "10101111", 
    163 => "00000000", 164 => "10110001", 165 => "10110011", 166 to 172=> "00000000", 
    173 => "10110101", 174 to 180=> "00000000", 181 => "10110111", 182 => "10111001", 
    183 to 194=> "00000000" );


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

entity predict_ensemble_bhl is
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

architecture arch of predict_ensemble_bhl is
    component predict_ensemble_bhl_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bhl_rom_U :  component predict_ensemble_bhl_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


