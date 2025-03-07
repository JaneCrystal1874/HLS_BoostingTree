-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cWB_rom is 
    generic(
             DWIDTH     : integer := 4; 
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


architecture rtl of predict_ensemble_cWB_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "1100", 4 => "1000", 
    5 => "1010", 6 => "0000", 7 => "0111", 8 => "0110", 9 to 11=> "0000", 
    12 => "1010", 13 to 14=> "0000", 15 => "1010", 16 => "1100", 17 => "1011", 
    18 to 19=> "0000", 20 => "0111", 21 => "0000", 22 => "0101", 23 to 24=> "0000", 
    25 => "0101", 26 => "0000", 27 => "0011", 28 => "0000", 29 to 30=> "0011", 
    31 to 33=> "0000", 34 to 35=> "1010", 36 => "0000", 37 => "1011", 38 => "0000", 
    39 => "1010", 40 => "1011", 41 => "0000", 42 => "1011", 43 => "0000", 
    44 => "0101", 45 => "0000", 46 => "1100", 47 => "0111", 48 to 49=> "0000", 
    50 => "0001", 51 => "0111", 52 => "0000", 53 => "0010", 54 => "0000", 
    55 => "1011", 56 => "1001", 57 => "0101", 58 to 60=> "0000", 61 => "0110", 
    62 => "1010", 63 => "0100", 64 => "1001", 65 to 66=> "0000", 67 => "1011", 
    68 to 72=> "0000", 73 => "1011", 74 => "0000", 75 => "0010", 76 => "0000", 
    77 => "1100", 78 => "0000", 79 => "0111", 80 => "0000", 81 => "0100", 
    82 => "1000", 83 => "0001", 84 => "1011", 85 => "0000", 86 => "1010", 
    87 => "1100", 88 => "0000", 89 => "0101", 90 => "0000", 91 => "1100", 
    92 => "1001", 93 to 96=> "0000", 97 => "1100", 98 => "0000", 99 => "0011", 
    100 => "0111", 101 => "0010", 102 => "0000", 103 => "0011", 104 => "0000", 
    105 => "0110", 106 to 109=> "0000", 110 => "0001", 111 => "0000", 112 => "0001", 
    113 => "0000", 114 => "1101", 115 => "0000", 116 => "0001", 117 to 119=> "0000", 
    120 => "1000", 121 => "0000", 122 => "0111", 123 => "0000", 124 => "1001", 
    125 => "0100", 126 => "0110", 127 => "0000", 128 => "0110", 129 => "1101", 
    130 => "1011", 131 => "0000", 132 => "0111", 133 => "0000", 134 to 135=> "0111", 
    136 => "1011", 137 to 138=> "0000", 139 => "1101", 140 => "0100", 141 to 142=> "0000", 
    143 => "0101", 144 => "1010", 145 => "0000", 146 => "0111", 147 => "1101", 
    148 to 150=> "0000", 151 => "1000", 152 => "0000", 153 => "0001", 154 to 156=> "0000", 
    157 => "1011", 158 => "0000", 159 => "0011", 160 => "0000", 161 => "0110", 
    162 => "1011", 163 to 164=> "0000", 165 => "0111", 166 => "0000", 167 => "1100", 
    168 => "0001", 169 to 172=> "0000", 173 => "1100", 174 => "1010", 175 => "0011", 
    176 to 178=> "0000", 179 => "0011", 180 => "0001", 181 to 183=> "0000", 184 => "0011", 
    185 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

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

entity predict_ensemble_cWB is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_cWB is
    component predict_ensemble_cWB_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cWB_rom_U :  component predict_ensemble_cWB_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


