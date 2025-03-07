-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_b5t_rom is 
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


architecture rtl of predict_ensemble_b5t_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000000", 
    4 => "00000101", 5 => "00000000", 6 => "00000111", 7 => "00000000", 
    8 => "00001001", 9 => "00001011", 10 => "00001101", 11 => "00000000", 
    12 => "00001111", 13 => "00010001", 14 to 16=> "00000000", 17 => "00010011", 
    18 => "00000000", 19 => "00010101", 20 => "00000000", 21 => "00010111", 
    22 => "00000000", 23 => "00011001", 24 => "00000000", 25 => "00011011", 
    26 => "00011101", 27 to 29=> "00000000", 30 => "00011111", 31 => "00100001", 
    32 => "00000000", 33 => "00100011", 34 => "00000000", 35 => "00100101", 
    36 => "00100111", 37 => "00000000", 38 => "00101001", 39 => "00000000", 
    40 => "00101011", 41 to 42=> "00000000", 43 => "00101101", 44 => "00000000", 
    45 => "00101111", 46 to 47=> "00000000", 48 => "00110001", 49 => "00110011", 
    50 => "00000000", 51 => "00110101", 52 => "00110111", 53 => "00000000", 
    54 => "00111001", 55 => "00111011", 56 => "00111101", 57 => "00111111", 
    58 => "00000000", 59 => "01000001", 60 => "00000000", 61 => "01000011", 
    62 => "00000000", 63 => "01000101", 64 => "01000111", 65 => "01001001", 
    66 => "00000000", 67 => "01001011", 68 to 72=> "00000000", 73 => "01001101", 
    74 to 75=> "00000000", 76 => "01001111", 77 => "01010001", 78 => "01010011", 
    79 to 80=> "00000000", 81 => "01010101", 82 => "01010111", 83 => "01011001", 
    84 => "00000000", 85 => "01011011", 86 => "00000000", 87 => "01011101", 
    88 => "01011111", 89 to 91=> "00000000", 92 => "01100001", 93 => "01100011", 
    94 => "00000000", 95 => "01100101", 96 => "01100111", 97 to 98=> "00000000", 
    99 => "01101001", 100 => "01101011", 101 => "00000000", 102 => "01101101", 
    103 => "00000000", 104 => "01101111", 105 => "00000000", 106 => "01110001", 
    107 to 109=> "00000000", 110 => "01110011", 111 => "01110101", 112 to 115=> "00000000", 
    116 => "01110111", 117 => "01111001", 118 to 121=> "00000000", 122 => "01111011", 
    123 => "00000000", 124 => "01111101", 125 => "00000000", 126 => "01111111", 
    127 => "10000001", 128 => "10000011", 129 => "10000101", 130 => "10000111", 
    131 => "10001001", 132 => "10001011", 133 => "00000000", 134 => "10001101", 
    135 => "10001111", 136 to 138=> "00000000", 139 => "10010001", 140 => "10010011", 
    141 => "10010101", 142 to 146=> "00000000", 147 => "10010111", 148 => "10011001", 
    149 to 150=> "00000000", 151 => "10011011", 152 => "10011101", 153 => "10011111", 
    154 => "10100001", 155 to 156=> "00000000", 157 => "10100011", 158 => "10100101", 
    159 to 162=> "00000000", 163 => "10100111", 164 to 165=> "00000000", 166 => "10101001", 
    167 => "00000000", 168 => "10101011", 169 => "10101101", 170 => "10101111", 
    171 => "10110001", 172 to 173=> "00000000", 174 => "10110011", 175 to 194=> "00000000" );


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

entity predict_ensemble_b5t is
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

architecture arch of predict_ensemble_b5t is
    component predict_ensemble_b5t_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_b5t_rom_U :  component predict_ensemble_b5t_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


