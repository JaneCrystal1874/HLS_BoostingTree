-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cJz_rom is 
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


architecture rtl of predict_ensemble_cJz_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000000", 2 => "00000011", 3 => "00000101", 
    4 => "00000111", 5 to 7=> "00000000", 8 => "00001001", 9 => "00000000", 
    10 => "00001011", 11 => "00000000", 12 => "00001101", 13 => "00001111", 
    14 => "00010001", 15 => "00010011", 16 => "00010101", 17 to 18=> "00000000", 
    19 => "00010111", 20 => "00011001", 21 to 22=> "00000000", 23 => "00011011", 
    24 to 26=> "00000000", 27 => "00011101", 28 to 29=> "00000000", 30 => "00011111", 
    31 => "00100001", 32 => "00100011", 33 => "00100101", 34 => "00100111", 
    35 => "00101001", 36 to 38=> "00000000", 39 => "00101011", 40 => "00101101", 
    41 => "00000000", 42 => "00101111", 43 => "00110001", 44 => "00000000", 
    45 => "00110011", 46 => "00110101", 47 => "00000000", 48 => "00110111", 
    49 => "00111001", 50 to 51=> "00000000", 52 => "00111011", 53 => "00000000", 
    54 => "00111101", 55 to 61=> "00000000", 62 => "00111111", 63 => "01000001", 
    64 => "00000000", 65 => "01000011", 66 to 67=> "00000000", 68 => "01000101", 
    69 => "01000111", 70 => "01001001", 71 => "00000000", 72 => "01001011", 
    73 => "01001101", 74 => "01001111", 75 => "01010001", 76 => "01010011", 
    77 => "01010101", 78 to 79=> "00000000", 80 => "01010111", 81 => "01011001", 
    82 to 86=> "00000000", 87 => "01011011", 88 => "01011101", 89 => "00000000", 
    90 => "01011111", 91 => "01100001", 92 => "00000000", 93 => "01100011", 
    94 to 96=> "00000000", 97 => "01100101", 98 => "00000000", 99 => "01100111", 
    100 to 103=> "00000000", 104 => "01101001", 105 => "01101011", 106 => "01101101", 
    107 => "01101111", 108 => "01110001", 109 => "01110011", 110 to 112=> "00000000", 
    113 => "01110101", 114 => "01110111", 115 => "01111001", 116 => "00000000", 
    117 => "01111011", 118 => "00000000", 119 => "01111101", 120 to 121=> "00000000", 
    122 => "01111111", 123 to 125=> "00000000", 126 => "10000001", 127 => "10000011", 
    128 => "10000101", 129 to 131=> "00000000", 132 => "10000111", 133 to 134=> "00000000", 
    135 => "10001001", 136 => "10001011", 137 => "10001101", 138 => "10001111", 
    139 to 142=> "00000000", 143 => "10010001", 144 => "00000000", 145 => "10010011", 
    146 => "10010101", 147 => "00000000", 148 => "10010111", 149 => "10011001", 
    150 => "00000000", 151 => "10011011", 152 => "10011101", 153 to 157=> "00000000", 
    158 => "10011111", 159 => "10100001", 160 => "10100011", 161 => "10100101", 
    162 => "00000000", 163 => "10100111", 164 => "10101001", 165 to 166=> "00000000", 
    167 => "10101011", 168 to 170=> "00000000", 171 => "10101101", 172 => "10101111", 
    173 => "10110001", 174 => "10110011", 175 to 176=> "00000000", 177 => "10110101", 
    178 to 181=> "00000000", 182 => "10110111", 183 => "10111001", 184 to 194=> "00000000" );


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

entity predict_ensemble_cJz is
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

architecture arch of predict_ensemble_cJz is
    component predict_ensemble_cJz_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cJz_rom_U :  component predict_ensemble_cJz_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


