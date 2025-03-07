-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_b3s_rom is 
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


architecture rtl of predict_ensemble_b3s_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "0000", 2 => "0110", 3 => "0000", 4 => "0111", 
    5 => "0000", 6 => "1011", 7 => "0000", 8 => "1011", 9 => "0111", 
    10 => "1000", 11 => "0000", 12 to 13=> "0101", 14 to 16=> "0000", 17 => "0101", 
    18 => "0000", 19 => "1010", 20 => "0000", 21 => "1010", 22 => "0000", 
    23 => "1100", 24 => "0000", 25 => "1000", 26 => "1100", 27 to 29=> "0000", 
    30 => "0110", 31 => "1010", 32 => "0000", 33 => "1011", 34 => "0000", 
    35 => "1001", 36 => "1011", 37 => "0000", 38 => "1010", 39 => "0000", 
    40 => "0001", 41 to 42=> "0000", 43 => "1011", 44 => "0000", 45 => "0100", 
    46 to 47=> "0000", 48 => "0101", 49 => "1000", 50 => "0000", 51 => "1011", 
    52 => "0110", 53 => "0000", 54 => "0110", 55 => "1000", 56 => "0011", 
    57 => "1100", 58 => "0000", 59 => "1000", 60 => "0000", 61 => "0110", 
    62 => "0000", 63 => "0100", 64 => "1000", 65 => "1101", 66 => "0000", 
    67 => "0010", 68 to 72=> "0000", 73 => "1000", 74 to 75=> "0000", 76 => "0001", 
    77 => "0011", 78 => "1010", 79 to 80=> "0000", 81 to 82=> "1001", 83 => "1100", 
    84 => "0000", 85 => "0111", 86 => "0000", 87 => "1001", 88 => "0001", 
    89 to 91=> "0000", 92 => "0100", 93 => "0011", 94 => "0000", 95 => "1000", 
    96 => "1100", 97 to 98=> "0000", 99 => "1000", 100 => "0101", 101 => "0000", 
    102 => "0100", 103 => "0000", 104 => "1000", 105 => "0000", 106 => "0111", 
    107 to 109=> "0000", 110 to 111=> "0001", 112 to 115=> "0000", 116 => "0100", 117 => "0110", 
    118 to 121=> "0000", 122 => "1011", 123 => "0000", 124 => "1001", 125 => "0000", 
    126 => "0011", 127 => "1100", 128 => "0110", 129 => "1001", 130 => "0100", 
    131 => "0011", 132 => "0110", 133 => "0000", 134 => "1100", 135 => "0011", 
    136 to 138=> "0000", 139 => "1000", 140 => "0111", 141 => "1000", 142 to 146=> "0000", 
    147 => "1001", 148 => "1100", 149 to 150=> "0000", 151 => "1000", 152 => "0010", 
    153 => "0001", 154 => "0101", 155 to 156=> "0000", 157 to 158=> "0010", 159 to 162=> "0000", 
    163 => "0001", 164 to 165=> "0000", 166 => "0001", 167 => "0000", 168 => "0110", 
    169 => "1000", 170 => "0101", 171 => "1100", 172 to 173=> "0000", 174 => "0100", 
    175 to 194=> "0000" );

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

entity predict_ensemble_b3s is
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

architecture arch of predict_ensemble_b3s is
    component predict_ensemble_b3s_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_b3s_rom_U :  component predict_ensemble_b3s_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


