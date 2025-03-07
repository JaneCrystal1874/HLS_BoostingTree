-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bVr_rom is 
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


architecture rtl of predict_ensemble_bVr_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 to 5=> "00000000", 6 => "00001001", 7 => "00000000", 8 => "00001011", 
    9 => "00000000", 10 => "00001101", 11 => "00000000", 12 => "00001111", 
    13 => "00010001", 14 to 17=> "00000000", 18 => "00010011", 19 => "00010101", 
    20 => "00000000", 21 => "00010111", 22 => "00000000", 23 => "00011001", 
    24 to 25=> "00000000", 26 => "00011011", 27 => "00000000", 28 => "00011101", 
    29 => "00000000", 30 => "00011111", 31 => "00100001", 32 => "00100011", 
    33 => "00100101", 34 => "00100111", 35 => "00101001", 36 => "00101011", 
    37 => "00000000", 38 => "00101101", 39 => "00101111", 40 to 43=> "00000000", 
    44 => "00110001", 45 to 46=> "00000000", 47 => "00110011", 48 to 50=> "00000000", 
    51 => "00110101", 52 => "00110111", 53 => "00111001", 54 => "00000000", 
    55 => "00111011", 56 => "00000000", 57 => "00111101", 58 => "00000000", 
    59 => "00111111", 60 => "01000001", 61 => "01000011", 62 => "01000101", 
    63 to 64=> "00000000", 65 => "01000111", 66 => "00000000", 67 => "01001001", 
    68 => "00000000", 69 => "01001011", 70 to 71=> "00000000", 72 => "01001101", 
    73 to 74=> "00000000", 75 => "01001111", 76 => "00000000", 77 => "01010001", 
    78 => "00000000", 79 => "01010011", 80 => "00000000", 81 => "01010101", 
    82 => "01010111", 83 => "01011001", 84 => "01011011", 85 to 87=> "00000000", 
    88 => "01011101", 89 to 91=> "00000000", 92 => "01011111", 93 => "01100001", 
    94 to 95=> "00000000", 96 => "01100011", 97 => "01100101", 98 to 100=> "00000000", 
    101 => "01100111", 102 => "01101001", 103 to 104=> "00000000", 105 => "01101011", 
    106 => "01101101", 107 => "01101111", 108 => "01110001", 109 => "01110011", 
    110 => "01110101", 111 => "01110111", 112 => "01111001", 113 to 114=> "00000000", 
    115 => "01111011", 116 => "00000000", 117 => "01111101", 118 => "00000000", 
    119 => "01111111", 120 => "00000000", 121 => "10000001", 122 => "10000011", 
    123 to 126=> "00000000", 127 => "10000101", 128 to 129=> "00000000", 130 => "10000111", 
    131 => "00000000", 132 => "10001001", 133 to 136=> "00000000", 137 => "10001011", 
    138 => "00000000", 139 => "10001101", 140 => "00000000", 141 => "10001111", 
    142 => "00000000", 143 => "10010001", 144 => "00000000", 145 => "10010011", 
    146 => "10010101", 147 to 149=> "00000000", 150 => "10010111", 151 => "10011001", 
    152 => "10011011", 153 => "10011101", 154 => "00000000", 155 => "10011111", 
    156 => "10100001", 157 => "10100011", 158 to 159=> "00000000", 160 => "10100101", 
    161 => "00000000", 162 => "10100111", 163 to 164=> "00000000", 165 => "10101001", 
    166 => "10101011", 167 => "00000000", 168 => "10101101", 169 => "10101111", 
    170 => "10110001", 171 to 172=> "00000000", 173 => "10110011", 174 => "10110101", 
    175 => "10110111", 176 to 194=> "00000000" );


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

entity predict_ensemble_bVr is
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

architecture arch of predict_ensemble_bVr is
    component predict_ensemble_bVr_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bVr_rom_U :  component predict_ensemble_bVr_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


