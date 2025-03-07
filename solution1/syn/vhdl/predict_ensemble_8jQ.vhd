-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_8jQ_rom is 
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


architecture rtl of predict_ensemble_8jQ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00000000", 5 => "00001010", 6 => "00000000", 7 => "00001100", 
    8 => "00001110", 9 => "00000000", 10 => "00010000", 11 => "00010010", 
    12 to 14=> "00000000", 15 => "00010100", 16 => "00010110", 17 => "00011000", 
    18 => "00000000", 19 => "00011010", 20 => "00000000", 21 => "00011100", 
    22 => "00011110", 23 to 24=> "00000000", 25 => "00100000", 26 => "00000000", 
    27 => "00100010", 28 => "00100100", 29 => "00000000", 30 => "00100110", 
    31 to 33=> "00000000", 34 => "00101000", 35 => "00101010", 36 => "00101100", 
    37 => "00101110", 38 => "00110000", 39 to 40=> "00000000", 41 => "00110010", 
    42 => "00110100", 43 to 44=> "00000000", 45 => "00110110", 46 => "00000000", 
    47 => "00111000", 48 => "00111010", 49 => "00000000", 50 => "00111100", 
    51 => "00000000", 52 => "00111110", 53 => "01000000", 54 => "01000010", 
    55 => "00000000", 56 => "01000100", 57 => "00000000", 58 => "01000110", 
    59 to 62=> "00000000", 63 => "01001000", 64 => "01001010", 65 => "01001100", 
    66 => "01001110", 67 to 69=> "00000000", 70 => "01010000", 71 => "00000000", 
    72 => "01010010", 73 => "00000000", 74 => "01010100", 75 => "01010110", 
    76 => "00000000", 77 => "01011000", 78 => "01011010", 79 => "00000000", 
    80 => "01011100", 81 => "01011110", 82 => "01100000", 83 => "01100010", 
    84 => "00000000", 85 => "01100100", 86 => "01100110", 87 => "01101000", 
    88 to 89=> "00000000", 90 => "01101010", 91 => "01101100", 92 => "01101110", 
    93 => "01110000", 94 => "01110010", 95 => "00000000", 96 => "01110100", 
    97 to 102=> "00000000", 103 => "01110110", 104 => "00000000", 105 => "01111000", 
    106 => "01111010", 107 to 108=> "00000000", 109 => "01111100", 110 => "01111110", 
    111 => "00000000", 112 => "10000000", 113 => "00000000", 114 => "10000010", 
    115 => "00000000", 116 => "10000100", 117 => "10000110", 118 => "00000000", 
    119 => "10001000", 120 to 122=> "00000000", 123 => "10001010", 124 to 128=> "00000000", 
    129 => "10001100", 130 => "10001110", 131 => "00000000", 132 => "10010000", 
    133 => "00000000", 134 => "10010010", 135 => "10010100", 136 => "10010110", 
    137 to 138=> "00000000", 139 => "10011000", 140 => "10011010", 141 => "10011100", 
    142 to 144=> "00000000", 145 => "10011110", 146 => "00000000", 147 => "10100000", 
    148 => "10100010", 149 to 150=> "00000000", 151 => "10100100", 152 => "00000000", 
    153 => "10100110", 154 to 160=> "00000000", 161 => "10101000", 162 => "00000000", 
    163 => "10101010", 164 => "10101100", 165 to 168=> "00000000", 169 => "10101110", 
    170 to 172=> "00000000", 173 => "10110000", 174 => "00000000", 175 => "10110010", 
    176 => "00000000", 177 => "10110100", 178 to 194=> "00000000" );


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

entity predict_ensemble_8jQ is
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

architecture arch of predict_ensemble_8jQ is
    component predict_ensemble_8jQ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_8jQ_rom_U :  component predict_ensemble_8jQ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


