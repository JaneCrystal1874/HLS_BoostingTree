-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_erQ_rom is 
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


architecture rtl of predict_ensemble_erQ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 to 6=> "00000000", 7 => "00001010", 8 => "00000000", 
    9 => "00001100", 10 => "00000000", 11 => "00001110", 12 => "00010000", 
    13 => "00010010", 14 => "00010100", 15 => "00010110", 16 => "00011000", 
    17 => "00011010", 18 to 20=> "00000000", 21 => "00011100", 22 => "00011110", 
    23 to 28=> "00000000", 29 => "00100000", 30 => "00100010", 31 => "00000000", 
    32 => "00100100", 33 => "00000000", 34 => "00100110", 35 to 36=> "00000000", 
    37 => "00101000", 38 => "00101010", 39 => "00000000", 40 => "00101100", 
    41 => "00000000", 42 => "00101110", 43 => "00110000", 44 => "00110010", 
    45 => "00110100", 46 to 47=> "00000000", 48 => "00110110", 49 to 50=> "00000000", 
    51 => "00111000", 52 => "00111010", 53 => "00111100", 54 => "00111110", 
    55 => "01000000", 56 => "01000010", 57 to 63=> "00000000", 64 => "01000100", 
    65 => "00000000", 66 => "01000110", 67 to 68=> "00000000", 69 => "01001000", 
    70 => "01001010", 71 => "00000000", 72 => "01001100", 73 => "00000000", 
    74 => "01001110", 75 => "00000000", 76 => "01010000", 77 => "00000000", 
    78 => "01010010", 79 => "01010100", 80 => "01010110", 81 => "00000000", 
    82 => "01011000", 83 to 84=> "00000000", 85 => "01011010", 86 => "00000000", 
    87 => "01011100", 88 => "01011110", 89 => "00000000", 90 => "01100000", 
    91 => "00000000", 92 => "01100010", 93 => "01100100", 94 to 98=> "00000000", 
    99 => "01100110", 100 => "01101000", 101 => "01101010", 102 to 105=> "00000000", 
    106 => "01101100", 107 => "00000000", 108 => "01101110", 109 => "00000000", 
    110 => "01110000", 111 => "00000000", 112 => "01110010", 113 => "00000000", 
    114 => "01110100", 115 => "01110110", 116 => "01111000", 117 => "01111010", 
    118 to 119=> "00000000", 120 => "01111100", 121 => "00000000", 122 => "01111110", 
    123 to 125=> "00000000", 126 => "10000000", 127 => "10000010", 128 => "10000100", 
    129 to 130=> "00000000", 131 => "10000110", 132 => "10001000", 133 => "10001010", 
    134 => "00000000", 135 => "10001100", 136 => "10001110", 137 to 138=> "00000000", 
    139 => "10010000", 140 => "00000000", 141 => "10010010", 142 to 144=> "00000000", 
    145 => "10010100", 146 => "10010110", 147 to 148=> "00000000", 149 => "10011000", 
    150 => "10011010", 151 => "10011100", 152 to 153=> "00000000", 154 => "10011110", 
    155 to 156=> "00000000", 157 => "10100000", 158 => "00000000", 159 => "10100010", 
    160 => "10100100", 161 => "00000000", 162 => "10100110", 163 to 164=> "00000000", 
    165 => "10101000", 166 => "10101010", 167 to 194=> "00000000" );


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

entity predict_ensemble_erQ is
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

architecture arch of predict_ensemble_erQ is
    component predict_ensemble_erQ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_erQ_rom_U :  component predict_ensemble_erQ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


