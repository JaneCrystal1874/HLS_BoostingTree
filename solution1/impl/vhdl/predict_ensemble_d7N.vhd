-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_d7N_rom is 
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


architecture rtl of predict_ensemble_d7N_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 => "00000000", 7 => "00001010", 
    8 => "00001100", 9 => "00001110", 10 => "00010000", 11 => "00000000", 
    12 => "00010010", 13 to 15=> "00000000", 16 => "00010100", 17 => "00010110", 
    18 to 19=> "00000000", 20 => "00011000", 21 => "00011010", 22 => "00011100", 
    23 => "00011110", 24 => "00100000", 25 to 26=> "00000000", 27 => "00100010", 
    28 => "00000000", 29 => "00100100", 30 to 31=> "00000000", 32 => "00100110", 
    33 => "00000000", 34 => "00101000", 35 => "00101010", 36 => "00000000", 
    37 => "00101100", 38 => "00101110", 39 => "00000000", 40 => "00110000", 
    41 => "00000000", 42 => "00110010", 43 => "00000000", 44 => "00110100", 
    45 => "00000000", 46 => "00110110", 47 => "00111000", 48 => "00000000", 
    49 => "00111010", 50 to 51=> "00000000", 52 => "00111100", 53 to 54=> "00000000", 
    55 => "00111110", 56 => "01000000", 57 to 59=> "00000000", 60 => "01000010", 
    61 to 63=> "00000000", 64 => "01000100", 65 => "00000000", 66 => "01000110", 
    67 to 68=> "00000000", 69 => "01001000", 70 => "01001010", 71 => "01001100", 
    72 to 73=> "00000000", 74 => "01001110", 75 => "00000000", 76 => "01010000", 
    77 => "00000000", 78 => "01010010", 79 => "00000000", 80 => "01010100", 
    81 => "01010110", 82 => "01011000", 83 to 85=> "00000000", 86 => "01011010", 
    87 => "01011100", 88 => "01011110", 89 to 91=> "00000000", 92 => "01100000", 
    93 => "00000000", 94 => "01100010", 95 to 96=> "00000000", 97 => "01100100", 
    98 => "00000000", 99 => "01100110", 100 => "01101000", 101 => "01101010", 
    102 => "01101100", 103 to 104=> "00000000", 105 => "01101110", 106 => "01110000", 
    107 to 111=> "00000000", 112 => "01110010", 113 => "01110100", 114 => "00000000", 
    115 => "01110110", 116 => "01111000", 117 to 119=> "00000000", 120 => "01111010", 
    121 => "01111100", 122 => "00000000", 123 => "01111110", 124 => "10000000", 
    125 => "10000010", 126 => "10000100", 127 => "10000110", 128 => "10001000", 
    129 => "00000000", 130 => "10001010", 131 to 134=> "00000000", 135 => "10001100", 
    136 to 139=> "00000000", 140 => "10001110", 141 => "10010000", 142 => "10010010", 
    143 => "10010100", 144 => "10010110", 145 => "10011000", 146 to 148=> "00000000", 
    149 => "10011010", 150 => "00000000", 151 => "10011100", 152 => "10011110", 
    153 => "00000000", 154 => "10100000", 155 => "00000000", 156 => "10100010", 
    157 => "10100100", 158 => "00000000", 159 => "10100110", 160 => "00000000", 
    161 => "10101000", 162 to 165=> "00000000", 166 => "10101010", 167 => "00000000", 
    168 => "10101100", 169 => "10101110", 170 to 171=> "00000000", 172 => "10110000", 
    173 => "10110010", 174 => "00000000", 175 => "10110100", 176 => "00000000", 
    177 => "10110110", 178 to 194=> "00000000" );


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

entity predict_ensemble_d7N is
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

architecture arch of predict_ensemble_d7N is
    component predict_ensemble_d7N_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_d7N_rom_U :  component predict_ensemble_d7N_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


