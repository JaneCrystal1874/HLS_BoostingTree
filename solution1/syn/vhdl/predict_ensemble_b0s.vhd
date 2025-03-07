-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_b0s_rom is 
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


architecture rtl of predict_ensemble_b0s_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00001001", 5 => "00001011", 6 => "00001101", 7 => "00001111", 
    8 => "00010001", 9 => "00010011", 10 => "00010101", 11 => "00010111", 
    12 => "00011001", 13 => "00011011", 14 => "00011101", 15 => "00011111", 
    16 => "00100001", 17 => "00100011", 18 => "00100101", 19 => "00100111", 
    20 to 21=> "00000000", 22 => "00101001", 23 => "00000000", 24 => "00101011", 
    25 to 27=> "00000000", 28 => "00101101", 29 => "00101111", 30 => "00110001", 
    31 => "00110011", 32 => "00110101", 33 => "00110111", 34 => "00111001", 
    35 to 39=> "00000000", 40 => "00111011", 41 => "00111101", 42 => "00000000", 
    43 => "00111111", 44 => "00000000", 45 => "01000001", 46 => "01000011", 
    47 => "01000101", 48 => "01000111", 49 => "01001001", 50 => "01001011", 
    51 => "01001101", 52 to 53=> "00000000", 54 => "01001111", 55 => "01010001", 
    56 => "00000000", 57 => "01010011", 58 => "00000000", 59 => "01010101", 
    60 => "01010111", 61 to 63=> "00000000", 64 => "01011001", 65 => "01011011", 
    66 => "01011101", 67 => "00000000", 68 => "01011111", 69 => "00000000", 
    70 => "01100001", 71 to 72=> "00000000", 73 => "01100011", 74 => "01100101", 
    75 => "00000000", 76 => "01100111", 77 => "00000000", 78 => "01101001", 
    79 => "01101011", 80 => "01101101", 81 to 82=> "00000000", 83 => "01101111", 
    84 => "01110001", 85 to 88=> "00000000", 89 => "01110011", 90 to 92=> "00000000", 
    93 => "01110101", 94 to 96=> "00000000", 97 => "01110111", 98 => "00000000", 
    99 => "01111001", 100 => "01111011", 101 to 102=> "00000000", 103 => "01111101", 
    104 => "00000000", 105 => "01111111", 106 => "00000000", 107 => "10000001", 
    108 => "10000011", 109 => "00000000", 110 => "10000101", 111 to 112=> "00000000", 
    113 => "10000111", 114 => "10001001", 115 to 116=> "00000000", 117 => "10001011", 
    118 => "10001101", 119 to 120=> "00000000", 121 => "10001111", 122 => "10010001", 
    123 to 124=> "00000000", 125 => "10010011", 126 => "00000000", 127 => "10010101", 
    128 => "00000000", 129 => "10010111", 130 => "10011001", 131 => "10011011", 
    132 => "00000000", 133 => "10011101", 134 to 136=> "00000000", 137 => "10011111", 
    138 => "10100001", 139 to 140=> "00000000", 141 => "10100011", 142 => "10100101", 
    143 to 150=> "00000000", 151 => "10100111", 152 to 153=> "00000000", 154 => "10101001", 
    155 => "10101011", 156 => "00000000", 157 => "10101101", 158 => "00000000", 
    159 => "10101111", 160 => "00000000", 161 => "10110001", 162 => "00000000", 
    163 => "10110011", 164 => "10110101", 165 to 166=> "00000000", 167 => "10110111", 
    168 to 177=> "00000000", 178 => "10111001", 179 => "10111011", 180 to 181=> "00000000", 
    182 => "10111101", 183 to 194=> "00000000" );


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

entity predict_ensemble_b0s is
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

architecture arch of predict_ensemble_b0s is
    component predict_ensemble_b0s_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_b0s_rom_U :  component predict_ensemble_b0s_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


