-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_c6D_rom is 
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


architecture rtl of predict_ensemble_c6D_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "0111", 3 => "1000", 4 to 5=> "1011", 
    6 to 7=> "0000", 8 => "1100", 9 => "0000", 10 => "0100", 11 => "0000", 
    12 => "0100", 13 to 14=> "0101", 15 => "0000", 16 => "1010", 17 => "0111", 
    18 => "0000", 19 => "0011", 20 => "0000", 21 => "1101", 22 => "1000", 
    23 => "0000", 24 => "0111", 25 => "0110", 26 => "0100", 27 => "0000", 
    28 => "1010", 29 => "1011", 30 to 31=> "0000", 32 => "0001", 33 to 34=> "0000", 
    35 => "1010", 36 => "0101", 37 => "0010", 38 to 39=> "0000", 40 => "1101", 
    41 => "1011", 42 to 43=> "1001", 44 => "1010", 45 => "0000", 46 => "1011", 
    47 to 48=> "0000", 49 => "0010", 50 to 53=> "0000", 54 => "1010", 55 => "0000", 
    56 => "1000", 57 to 59=> "0000", 60 => "0111", 61 => "1011", 62 => "0111", 
    63 => "0000", 64 => "0010", 65 => "1000", 66 to 67=> "0000", 68 => "1000", 
    69 to 70=> "1011", 71 to 73=> "0000", 74 => "0001", 75 => "1011", 76 to 77=> "0000", 
    78 to 79=> "1010", 80 to 81=> "0000", 82 => "1000", 83 => "0000", 84 => "0110", 
    85 => "0000", 86 => "0011", 87 to 90=> "0000", 91 => "1100", 92 => "1001", 
    93 => "0000", 94 => "0110", 95 => "0000", 96 => "1100", 97 => "0001", 
    98 => "0000", 99 => "0101", 100 => "0000", 101 => "0101", 102 to 103=> "0100", 
    104 to 105=> "0000", 106 => "0010", 107 to 109=> "0000", 110 => "1010", 111 => "0110", 
    112 => "0000", 113 => "1000", 114 to 118=> "0000", 119 => "0010", 120 => "0000", 
    121 => "1100", 122 to 123=> "0000", 124 => "0100", 125 => "1100", 126 to 127=> "0000", 
    128 => "0001", 129 => "0000", 130 => "1011", 131 to 133=> "0000", 134 => "0101", 
    135 => "0100", 136 => "1010", 137 to 138=> "0000", 139 => "0110", 140 to 141=> "0000", 
    142 => "0100", 143 => "0101", 144 to 145=> "1101", 146 => "0000", 147 => "0101", 
    148 => "1101", 149 => "0000", 150 => "1100", 151 => "1011", 152 to 153=> "0000", 
    154 => "0110", 155 to 158=> "0000", 159 => "0101", 160 => "1101", 161 => "1000", 
    162 => "1101", 163 => "0000", 164 => "1101", 165 to 168=> "0000", 169 => "1011", 
    170 => "0100", 171 => "0000", 172 => "1100", 173 => "0000", 174 => "0100", 
    175 => "0101", 176 => "0000", 177 => "1100", 178 => "0000", 179 => "0111", 
    180 => "0000", 181 => "1100", 182 => "0000", 183 => "1010", 184 to 187=> "0000", 
    188 => "1001", 189 to 194=> "0000" );

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

entity predict_ensemble_c6D is
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

architecture arch of predict_ensemble_c6D is
    component predict_ensemble_c6D_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_c6D_rom_U :  component predict_ensemble_c6D_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


