-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_e0W_rom is 
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


architecture rtl of predict_ensemble_e0W_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000000", 3 => "00000110", 
    4 => "00001000", 5 => "00001010", 6 => "00001100", 7 => "00000000", 
    8 => "00001110", 9 => "00010000", 10 to 11=> "00000000", 12 => "00010010", 
    13 => "00010100", 14 to 15=> "00000000", 16 => "00010110", 17 => "00011000", 
    18 => "00000000", 19 => "00011010", 20 to 21=> "00000000", 22 => "00011100", 
    23 to 24=> "00000000", 25 => "00011110", 26 => "00100000", 27 => "00100010", 
    28 => "00100100", 29 => "00100110", 30 to 31=> "00000000", 32 => "00101000", 
    33 to 35=> "00000000", 36 => "00101010", 37 => "00000000", 38 => "00101100", 
    39 => "00101110", 40 to 43=> "00000000", 44 => "00110000", 45 => "00000000", 
    46 => "00110010", 47 => "00000000", 48 => "00110100", 49 => "00110110", 
    50 => "00000000", 51 => "00111000", 52 to 53=> "00000000", 54 => "00111010", 
    55 => "00000000", 56 => "00111100", 57 => "00111110", 58 => "01000000", 
    59 => "00000000", 60 => "01000010", 61 => "00000000", 62 => "01000100", 
    63 => "00000000", 64 => "01000110", 65 => "00000000", 66 => "01001000", 
    67 => "01001010", 68 to 69=> "00000000", 70 => "01001100", 71 => "00000000", 
    72 => "01001110", 73 => "01010000", 74 => "01010010", 75 to 76=> "00000000", 
    77 => "01010100", 78 to 81=> "00000000", 82 => "01010110", 83 to 85=> "00000000", 
    86 => "01011000", 87 => "00000000", 88 => "01011010", 89 => "00000000", 
    90 => "01011100", 91 => "00000000", 92 => "01011110", 93 => "01100000", 
    94 => "00000000", 95 => "01100010", 96 => "00000000", 97 => "01100100", 
    98 => "01100110", 99 => "00000000", 100 => "01101000", 101 => "01101010", 
    102 => "01101100", 103 => "01101110", 104 => "00000000", 105 => "01110000", 
    106 to 110=> "00000000", 111 => "01110010", 112 => "00000000", 113 => "01110100", 
    114 to 115=> "00000000", 116 => "01110110", 117 => "01111000", 118 => "01111010", 
    119 to 120=> "00000000", 121 => "01111100", 122 => "01111110", 123 => "10000000", 
    124 => "00000000", 125 => "10000010", 126 to 127=> "00000000", 128 => "10000100", 
    129 => "10000110", 130 => "10001000", 131 => "00000000", 132 => "10001010", 
    133 => "00000000", 134 => "10001100", 135 => "00000000", 136 => "10001110", 
    137 => "00000000", 138 => "10010000", 139 to 143=> "00000000", 144 => "10010010", 
    145 => "10010100", 146 => "10010110", 147 => "10011000", 148 => "10011010", 
    149 to 150=> "00000000", 151 => "10011100", 152 => "00000000", 153 => "10011110", 
    154 => "00000000", 155 => "10100000", 156 => "10100010", 157 to 158=> "00000000", 
    159 => "10100100", 160 to 162=> "00000000", 163 => "10100110", 164 => "00000000", 
    165 => "10101000", 166 => "00000000", 167 => "10101010", 168 to 194=> "00000000" );


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

entity predict_ensemble_e0W is
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

architecture arch of predict_ensemble_e0W is
    component predict_ensemble_e0W_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_e0W_rom_U :  component predict_ensemble_e0W_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


