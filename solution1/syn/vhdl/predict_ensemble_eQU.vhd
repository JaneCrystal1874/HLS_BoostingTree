-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eQU_rom is 
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


architecture rtl of predict_ensemble_eQU_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00000000", 5 => "00001010", 6 => "00000000", 7 => "00001100", 
    8 => "00000000", 9 => "00001110", 10 to 11=> "00000000", 12 => "00010000", 
    13 => "00010010", 14 => "00010100", 15 => "00010110", 16 to 21=> "00000000", 
    22 => "00011000", 23 => "00011010", 24 to 25=> "00000000", 26 => "00011100", 
    27 => "00011110", 28 to 29=> "00000000", 30 => "00100000", 31 => "00100010", 
    32 => "00100100", 33 => "00000000", 34 => "00100110", 35 => "00101000", 
    36 => "00101010", 37 => "00101100", 38 => "00000000", 39 => "00101110", 
    40 => "00000000", 41 => "00110000", 42 to 44=> "00000000", 45 => "00110010", 
    46 => "00110100", 47 to 48=> "00000000", 49 => "00110110", 50 => "00111000", 
    51 => "00111010", 52 => "00000000", 53 => "00111100", 54 to 57=> "00000000", 
    58 => "00111110", 59 => "00000000", 60 => "01000000", 61 => "01000010", 
    62 => "01000100", 63 => "00000000", 64 => "01000110", 65 => "01001000", 
    66 to 67=> "00000000", 68 => "01001010", 69 => "00000000", 70 => "01001100", 
    71 => "01001110", 72 => "01010000", 73 to 75=> "00000000", 76 => "01010010", 
    77 to 80=> "00000000", 81 => "01010100", 82 to 83=> "00000000", 84 => "01010110", 
    85 => "01011000", 86 => "01011010", 87 => "00000000", 88 => "01011100", 
    89 => "00000000", 90 => "01011110", 91 => "01100000", 92 to 94=> "00000000", 
    95 => "01100010", 96 => "01100100", 97 => "00000000", 98 => "01100110", 
    99 => "00000000", 100 => "01101000", 101 => "01101010", 102 => "00000000", 
    103 => "01101100", 104 => "01101110", 105 to 109=> "00000000", 110 => "01110000", 
    111 => "00000000", 112 => "01110010", 113 => "01110100", 114 => "01110110", 
    115 to 116=> "00000000", 117 => "01111000", 118 => "00000000", 119 => "01111010", 
    120 => "00000000", 121 => "01111100", 122 => "01111110", 123 => "00000000", 
    124 => "10000000", 125 => "10000010", 126 => "10000100", 127 to 128=> "00000000", 
    129 => "10000110", 130 => "10001000", 131 => "10001010", 132 => "10001100", 
    133 to 135=> "00000000", 136 => "10001110", 137 => "10010000", 138 => "10010010", 
    139 => "10010100", 140 to 146=> "00000000", 147 => "10010110", 148 => "00000000", 
    149 => "10011000", 150 => "00000000", 151 => "10011010", 152 => "10011100", 
    153 => "00000000", 154 => "10011110", 155 => "10100000", 156 to 157=> "00000000", 
    158 => "10100010", 159 => "10100100", 160 to 161=> "00000000", 162 => "10100110", 
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

entity predict_ensemble_eQU is
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

architecture arch of predict_ensemble_eQU is
    component predict_ensemble_eQU_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eQU_rom_U :  component predict_ensemble_eQU_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


