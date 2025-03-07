-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Thq_rom is 
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


architecture rtl of predict_ensemble_Thq_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00000000", 5 => "00001010", 6 => "00001100", 7 => "00000000", 
    8 => "00001110", 9 to 13=> "00000000", 14 => "00010000", 15 => "00010010", 
    16 => "00000000", 17 => "00010100", 18 => "00000000", 19 => "00010110", 
    20 => "00011000", 21 => "00000000", 22 => "00011010", 23 => "00000000", 
    24 => "00011100", 25 to 27=> "00000000", 28 => "00011110", 29 => "00100000", 
    30 => "00100010", 31 to 33=> "00000000", 34 => "00100100", 35 => "00100110", 
    36 => "00101000", 37 to 38=> "00000000", 39 => "00101010", 40 => "00101100", 
    41 => "00101110", 42 => "00000000", 43 => "00110000", 44 => "00110010", 
    45 => "00110100", 46 => "00000000", 47 => "00110110", 48 => "00000000", 
    49 => "00111000", 50 => "00111010", 51 to 52=> "00000000", 53 => "00111100", 
    54 to 56=> "00000000", 57 => "00111110", 58 => "01000000", 59 to 60=> "00000000", 
    61 => "01000010", 62 to 64=> "00000000", 65 => "01000100", 66 => "01000110", 
    67 => "01001000", 68 to 69=> "00000000", 70 => "01001010", 71 => "01001100", 
    72 => "01001110", 73 => "01010000", 74 => "01010010", 75 => "01010100", 
    76 to 77=> "00000000", 78 => "01010110", 79 => "01011000", 80 to 81=> "00000000", 
    82 => "01011010", 83 => "00000000", 84 => "01011100", 85 to 88=> "00000000", 
    89 => "01011110", 90 => "01100000", 91 => "01100010", 92 => "01100100", 
    93 to 94=> "00000000", 95 => "01100110", 96 => "01101000", 97 to 98=> "00000000", 
    99 => "01101010", 100 => "00000000", 101 => "01101100", 102 to 106=> "00000000", 
    107 => "01101110", 108 => "01110000", 109 => "00000000", 110 => "01110010", 
    111 => "01110100", 112 => "01110110", 113 to 115=> "00000000", 116 => "01111000", 
    117 => "01111010", 118 => "01111100", 119 => "00000000", 120 => "01111110", 
    121 to 122=> "00000000", 123 => "10000000", 124 => "00000000", 125 => "10000010", 
    126 => "10000100", 127 => "10000110", 128 => "10001000", 129 to 131=> "00000000", 
    132 => "10001010", 133 => "10001100", 134 => "10001110", 135 to 139=> "00000000", 
    140 => "10010000", 141 => "10010010", 142 => "10010100", 143 => "10010110", 
    144 => "10011000", 145 => "10011010", 146 => "10011100", 147 => "00000000", 
    148 => "10011110", 149 => "00000000", 150 => "10100000", 151 => "10100010", 
    152 => "00000000", 153 => "10100100", 154 => "10100110", 155 => "00000000", 
    156 => "10101000", 157 to 160=> "00000000", 161 => "10101010", 162 to 167=> "00000000", 
    168 => "10101100", 169 to 170=> "00000000", 171 => "10101110", 172 => "10110000", 
    173 => "00000000", 174 => "10110010", 175 => "00000000", 176 => "10110100", 
    177 to 194=> "00000000" );


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

entity predict_ensemble_Thq is
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

architecture arch of predict_ensemble_Thq is
    component predict_ensemble_Thq_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Thq_rom_U :  component predict_ensemble_Thq_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


