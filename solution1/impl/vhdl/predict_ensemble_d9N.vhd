-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_d9N_rom is 
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


architecture rtl of predict_ensemble_d9N_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0011", 4 => "1011", 
    5 to 6=> "0000", 7 => "1010", 8 => "1011", 9 to 11=> "0000", 12 to 13=> "0101", 
    14 => "0000", 15 => "0011", 16 to 17=> "0000", 18 => "1001", 19 => "0000", 
    20 => "1010", 21 => "0000", 22 => "1010", 23 => "0000", 24 => "0110", 
    25 to 26=> "1010", 27 => "0111", 28 to 29=> "0000", 30 => "1011", 31 => "0000", 
    32 => "1010", 33 => "0000", 34 => "0111", 35 => "0110", 36 => "0000", 
    37 => "0111", 38 => "0011", 39 => "0000", 40 => "1010", 41 => "1001", 
    42 to 43=> "0000", 44 => "0101", 45 => "0000", 46 => "1100", 47 to 48=> "0000", 
    49 => "0011", 50 => "0001", 51 => "0000", 52 => "1010", 53 => "0010", 
    54 => "1100", 55 => "0000", 56 => "0101", 57 => "0000", 58 => "1011", 
    59 => "0000", 60 => "0101", 61 => "0000", 62 => "0010", 63 => "1011", 
    64 to 65=> "0000", 66 => "1101", 67 to 69=> "0000", 70 => "0110", 71 => "0011", 
    72 => "0000", 73 => "1011", 74 => "1001", 75 => "1011", 76 to 77=> "0000", 
    78 => "0011", 79 => "0000", 80 => "1010", 81 => "0000", 82 => "0101", 
    83 => "0000", 84 => "1101", 85 to 87=> "0000", 88 => "0001", 89 to 90=> "0000", 
    91 => "1100", 92 => "0010", 93 => "0000", 94 => "1001", 95 to 99=> "0000", 
    100 => "1001", 101 => "0000", 102 => "0001", 103 => "1000", 104 => "0000", 
    105 => "0100", 106 to 107=> "0000", 108 => "1101", 109 => "0000", 110 => "0011", 
    111 => "0000", 112 => "0111", 113 => "0101", 114 => "0111", 115 to 117=> "0000", 
    118 => "1010", 119 => "1100", 120 => "0000", 121 => "1011", 122 => "0000", 
    123 => "0001", 124 => "0000", 125 => "1011", 126 => "0000", 127 => "1011", 
    128 => "0111", 129 => "1010", 130 to 132=> "0000", 133 => "0001", 134 => "0101", 
    135 => "0100", 136 => "0000", 137 => "1001", 138 to 140=> "0000", 141 => "1100", 
    142 => "0111", 143 => "0000", 144 => "1001", 145 => "0000", 146 => "1101", 
    147 => "0000", 148 => "0111", 149 => "1101", 150 to 151=> "1000", 152 => "0100", 
    153 => "1010", 154 => "0000", 155 => "1001", 156 to 158=> "0000", 159 => "0100", 
    160 => "1000", 161 => "0111", 162 to 164=> "0000", 165 => "0011", 166 to 169=> "0000", 
    170 => "0011", 171 => "0111", 172 to 194=> "0000" );

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

entity predict_ensemble_d9N is
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

architecture arch of predict_ensemble_d9N is
    component predict_ensemble_d9N_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_d9N_rom_U :  component predict_ensemble_d9N_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


