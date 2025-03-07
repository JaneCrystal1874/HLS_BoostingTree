-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ePU_rom is 
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


architecture rtl of predict_ensemble_ePU_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000111", 
    4 => "00000000", 5 => "00001001", 6 => "00000000", 7 => "00001011", 
    8 => "00000000", 9 => "00001101", 10 to 11=> "00000000", 12 => "00001111", 
    13 => "00010001", 14 => "00010011", 15 => "00010101", 16 to 21=> "00000000", 
    22 => "00010111", 23 => "00011001", 24 to 25=> "00000000", 26 => "00011011", 
    27 => "00011101", 28 to 29=> "00000000", 30 => "00011111", 31 => "00100001", 
    32 => "00100011", 33 => "00000000", 34 => "00100101", 35 => "00100111", 
    36 => "00101001", 37 => "00101011", 38 => "00000000", 39 => "00101101", 
    40 => "00000000", 41 => "00101111", 42 to 44=> "00000000", 45 => "00110001", 
    46 => "00110011", 47 to 48=> "00000000", 49 => "00110101", 50 => "00110111", 
    51 => "00111001", 52 => "00000000", 53 => "00111011", 54 to 57=> "00000000", 
    58 => "00111101", 59 => "00000000", 60 => "00111111", 61 => "01000001", 
    62 => "01000011", 63 => "00000000", 64 => "01000101", 65 => "01000111", 
    66 to 67=> "00000000", 68 => "01001001", 69 => "00000000", 70 => "01001011", 
    71 => "01001101", 72 => "01001111", 73 to 75=> "00000000", 76 => "01010001", 
    77 to 80=> "00000000", 81 => "01010011", 82 to 83=> "00000000", 84 => "01010101", 
    85 => "01010111", 86 => "01011001", 87 => "00000000", 88 => "01011011", 
    89 => "00000000", 90 => "01011101", 91 => "01011111", 92 to 94=> "00000000", 
    95 => "01100001", 96 => "01100011", 97 => "00000000", 98 => "01100101", 
    99 => "00000000", 100 => "01100111", 101 => "01101001", 102 => "00000000", 
    103 => "01101011", 104 => "01101101", 105 to 109=> "00000000", 110 => "01101111", 
    111 => "00000000", 112 => "01110001", 113 => "01110011", 114 => "01110101", 
    115 to 116=> "00000000", 117 => "01110111", 118 => "00000000", 119 => "01111001", 
    120 => "00000000", 121 => "01111011", 122 => "01111101", 123 => "00000000", 
    124 => "01111111", 125 => "10000001", 126 => "10000011", 127 to 128=> "00000000", 
    129 => "10000101", 130 => "10000111", 131 => "10001001", 132 => "10001011", 
    133 to 135=> "00000000", 136 => "10001101", 137 => "10001111", 138 => "10010001", 
    139 => "10010011", 140 to 146=> "00000000", 147 => "10010101", 148 => "00000000", 
    149 => "10010111", 150 => "00000000", 151 => "10011001", 152 => "10011011", 
    153 => "00000000", 154 => "10011101", 155 => "10011111", 156 to 157=> "00000000", 
    158 => "10100001", 159 => "10100011", 160 to 161=> "00000000", 162 => "10100101", 
    163 to 194=> "00000000" );


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

entity predict_ensemble_ePU is
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

architecture arch of predict_ensemble_ePU is
    component predict_ensemble_ePU_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ePU_rom_U :  component predict_ensemble_ePU_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


