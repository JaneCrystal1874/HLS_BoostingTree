-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eFT_rom is 
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


architecture rtl of predict_ensemble_eFT_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 to 6=> "00000000", 7 => "00001001", 8 => "00001011", 
    9 => "00001101", 10 => "00000000", 11 => "00001111", 12 to 13=> "00000000", 
    14 => "00010001", 15 => "00010011", 16 => "00000000", 17 => "00010101", 
    18 => "00010111", 19 => "00011001", 20 => "00011011", 21 => "00011101", 
    22 => "00000000", 23 => "00011111", 24 => "00100001", 25 => "00000000", 
    26 => "00100011", 27 => "00100101", 28 => "00100111", 29 => "00101001", 
    30 => "00000000", 31 => "00101011", 32 => "00101101", 33 => "00101111", 
    34 => "00110001", 35 => "00110011", 36 => "00000000", 37 => "00110101", 
    38 => "00110111", 39 => "00111001", 40 => "00111011", 41 => "00111101", 
    42 => "00000000", 43 => "00111111", 44 to 46=> "00000000", 47 => "01000001", 
    48 => "00000000", 49 => "01000011", 50 => "00000000", 51 => "01000101", 
    52 => "01000111", 53 to 57=> "00000000", 58 => "01001001", 59 => "00000000", 
    60 => "01001011", 61 to 69=> "00000000", 70 => "01001101", 71 => "01001111", 
    72 => "01010001", 73 => "01010011", 74 to 75=> "00000000", 76 => "01010101", 
    77 => "01010111", 78 => "01011001", 79 to 81=> "00000000", 82 => "01011011", 
    83 => "01011101", 84 => "01011111", 85 => "00000000", 86 => "01100001", 
    87 to 89=> "00000000", 90 => "01100011", 91 to 92=> "00000000", 93 => "01100101", 
    94 => "00000000", 95 => "01100111", 96 => "01101001", 97 => "01101011", 
    98 => "01101101", 99 to 100=> "00000000", 101 => "01101111", 102 => "01110001", 
    103 => "00000000", 104 => "01110011", 105 => "00000000", 106 => "01110101", 
    107 to 109=> "00000000", 110 => "01110111", 111 => "01111001", 112 => "00000000", 
    113 => "01111011", 114 to 116=> "00000000", 117 => "01111101", 118 => "01111111", 
    119 => "10000001", 120 => "10000011", 121 => "10000101", 122 => "10000111", 
    123 => "10001001", 124 to 126=> "00000000", 127 => "10001011", 128 => "10001101", 
    129 => "10001111", 130 => "00000000", 131 => "10010001", 132 => "00000000", 
    133 => "10010011", 134 => "10010101", 135 => "10010111", 136 to 137=> "00000000", 
    138 => "10011001", 139 to 141=> "00000000", 142 => "10011011", 143 => "00000000", 
    144 => "10011101", 145 => "00000000", 146 => "10011111", 147 to 149=> "00000000", 
    150 => "10100001", 151 to 153=> "00000000", 154 => "10100011", 155 => "00000000", 
    156 => "10100101", 157 => "10100111", 158 => "00000000", 159 => "10101001", 
    160 => "00000000", 161 => "10101011", 162 => "10101101", 163 => "00000000", 
    164 => "10101111", 165 to 170=> "00000000", 171 => "10110001", 172 => "00000000", 
    173 => "10110011", 174 => "00000000", 175 => "10110101", 176 to 177=> "00000000", 
    178 => "10110111", 179 => "10111001", 180 to 194=> "00000000" );


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

entity predict_ensemble_eFT is
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

architecture arch of predict_ensemble_eFT is
    component predict_ensemble_eFT_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eFT_rom_U :  component predict_ensemble_eFT_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


