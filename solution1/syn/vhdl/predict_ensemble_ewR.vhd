-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ewR_rom is 
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


architecture rtl of predict_ensemble_ewR_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 => "00001010", 6 => "00000000", 7 => "00001100", 
    8 to 9=> "00000000", 10 => "00001110", 11 => "00000000", 12 => "00010000", 
    13 => "00010010", 14 => "00010100", 15 => "00010110", 16 => "00011000", 
    17 to 23=> "00000000", 24 => "00011010", 25 => "00000000", 26 => "00011100", 
    27 => "00000000", 28 => "00011110", 29 => "00100000", 30 to 31=> "00000000", 
    32 => "00100010", 33 => "00000000", 34 => "00100100", 35 => "00000000", 
    36 => "00100110", 37 => "00101000", 38 => "00101010", 39 => "00101100", 
    40 to 41=> "00000000", 42 => "00101110", 43 => "00110000", 44 => "00110010", 
    45 to 49=> "00000000", 50 => "00110100", 51 => "00110110", 52 to 53=> "00000000", 
    54 => "00111000", 55 => "00111010", 56 => "00111100", 57 => "00111110", 
    58 => "01000000", 59 to 60=> "00000000", 61 => "01000010", 62 to 65=> "00000000", 
    66 => "01000100", 67 => "01000110", 68 => "01001000", 69 to 70=> "00000000", 
    71 => "01001010", 72 => "01001100", 73 => "01001110", 74 => "00000000", 
    75 => "01010000", 76 => "00000000", 77 => "01010010", 78 => "00000000", 
    79 => "01010100", 80 => "00000000", 81 => "01010110", 82 => "01011000", 
    83 => "01011010", 84 to 89=> "00000000", 90 => "01011100", 91 => "01011110", 
    92 => "01100000", 93 => "01100010", 94 => "01100100", 95 => "01100110", 
    96 => "01101000", 97 to 99=> "00000000", 100 => "01101010", 101 => "01101100", 
    102 to 103=> "00000000", 104 => "01101110", 105 to 107=> "00000000", 108 => "01110000", 
    109 => "01110010", 110 => "01110100", 111 => "00000000", 112 => "01110110", 
    113 to 114=> "00000000", 115 => "01111000", 116 to 118=> "00000000", 119 => "01111010", 
    120 => "01111100", 121 => "01111110", 122 => "00000000", 123 => "10000000", 
    124 to 127=> "00000000", 128 => "10000010", 129 => "00000000", 130 => "10000100", 
    131 => "10000110", 132 => "10001000", 133 => "10001010", 134 => "10001100", 
    135 => "00000000", 136 => "10001110", 137 to 140=> "00000000", 141 => "10010000", 
    142 => "10010010", 143 to 144=> "00000000", 145 => "10010100", 146 => "10010110", 
    147 => "00000000", 148 => "10011000", 149 => "10011010", 150 => "00000000", 
    151 => "10011100", 152 to 154=> "00000000", 155 => "10011110", 156 => "10100000", 
    157 to 159=> "00000000", 160 => "10100010", 161 => "00000000", 162 => "10100100", 
    163 => "00000000", 164 => "10100110", 165 to 194=> "00000000" );


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

entity predict_ensemble_ewR is
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

architecture arch of predict_ensemble_ewR is
    component predict_ensemble_ewR_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ewR_rom_U :  component predict_ensemble_ewR_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


