-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dtH_rom is 
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


architecture rtl of predict_ensemble_dtH_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00001100", 
    8 => "00001110", 9 => "00010000", 10 => "00010010", 11 => "00000000", 
    12 => "00010100", 13 => "00000000", 14 => "00010110", 15 to 21=> "00000000", 
    22 => "00011000", 23 => "00000000", 24 => "00011010", 25 => "00011100", 
    26 => "00000000", 27 => "00011110", 28 => "00000000", 29 => "00100000", 
    30 => "00100010", 31 => "00100100", 32 to 33=> "00000000", 34 => "00100110", 
    35 to 36=> "00000000", 37 => "00101000", 38 => "00101010", 39 to 40=> "00000000", 
    41 => "00101100", 42 => "00101110", 43 => "00110000", 44 to 45=> "00000000", 
    46 => "00110010", 47 => "00000000", 48 => "00110100", 49 => "00110110", 
    50 => "00111000", 51 to 55=> "00000000", 56 => "00111010", 57 => "00111100", 
    58 => "00111110", 59 => "00000000", 60 => "01000000", 61 => "00000000", 
    62 => "01000010", 63 => "00000000", 64 => "01000100", 65 => "01000110", 
    66 => "01001000", 67 to 68=> "00000000", 69 => "01001010", 70 => "00000000", 
    71 => "01001100", 72 to 75=> "00000000", 76 => "01001110", 77 => "00000000", 
    78 => "01010000", 79 => "01010010", 80 => "01010100", 81 => "01010110", 
    82 => "00000000", 83 => "01011000", 84 to 85=> "00000000", 86 => "01011010", 
    87 => "01011100", 88 to 90=> "00000000", 91 => "01011110", 92 => "00000000", 
    93 => "01100000", 94 => "01100010", 95 => "01100100", 96 => "00000000", 
    97 => "01100110", 98 => "01101000", 99 => "01101010", 100 => "00000000", 
    101 => "01101100", 102 => "00000000", 103 => "01101110", 104 => "01110000", 
    105 => "01110010", 106 => "00000000", 107 => "01110100", 108 => "00000000", 
    109 => "01110110", 110 to 115=> "00000000", 116 => "01111000", 117 to 119=> "00000000", 
    120 => "01111010", 121 => "01111100", 122 to 123=> "00000000", 124 => "01111110", 
    125 => "00000000", 126 => "10000000", 127 => "10000010", 128 => "10000100", 
    129 to 130=> "00000000", 131 => "10000110", 132 => "00000000", 133 => "10001000", 
    134 => "10001010", 135 => "10001100", 136 => "00000000", 137 => "10001110", 
    138 => "00000000", 139 => "10010000", 140 => "10010010", 141 to 142=> "00000000", 
    143 => "10010100", 144 => "10010110", 145 to 146=> "00000000", 147 => "10011000", 
    148 => "10011010", 149 to 152=> "00000000", 153 => "10011100", 154 => "10011110", 
    155 => "00000000", 156 => "10100000", 157 => "10100010", 158 => "10100100", 
    159 => "10100110", 160 => "00000000", 161 => "10101000", 162 to 163=> "00000000", 
    164 => "10101010", 165 to 167=> "00000000", 168 => "10101100", 169 => "10101110", 
    170 to 171=> "00000000", 172 => "10110000", 173 to 174=> "00000000", 175 => "10110010", 
    176 => "00000000", 177 => "10110100", 178 to 179=> "00000000", 180 => "10110110", 
    181 to 194=> "00000000" );


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

entity predict_ensemble_dtH is
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

architecture arch of predict_ensemble_dtH is
    component predict_ensemble_dtH_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dtH_rom_U :  component predict_ensemble_dtH_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


