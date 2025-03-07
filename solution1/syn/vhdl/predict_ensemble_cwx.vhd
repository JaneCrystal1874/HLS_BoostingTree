-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cwx_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_cwx_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 => "0", 5 => "1", 6 to 7=> "0", 
    8 => "1", 9 to 10=> "0", 11 to 13=> "1", 14 => "0", 15 => "1", 16 to 17=> "0", 18 => "1", 
    19 => "0", 20 => "1", 21 => "0", 22 => "1", 23 to 26=> "0", 27 to 28=> "1", 29 => "0", 
    30 to 31=> "1", 32 to 33=> "0", 34 => "1", 35 to 36=> "0", 37 to 41=> "1", 42 to 43=> "0", 44 to 45=> "1", 
    46 to 47=> "0", 48 => "1", 49 to 51=> "0", 52 to 53=> "1", 54 to 60=> "0", 61 to 63=> "1", 64 => "0", 
    65 => "1", 66 => "0", 67 to 71=> "1", 72 to 73=> "0", 74 => "1", 75 => "0", 76 => "1", 
    77 => "0", 78 to 80=> "1", 81 => "0", 82 => "1", 83 to 84=> "0", 85 => "1", 86 to 88=> "0", 
    89 to 90=> "1", 91 => "0", 92 to 94=> "1", 95 => "0", 96 to 97=> "1", 98 to 101=> "0", 102 to 103=> "1", 
    104 => "0", 105 => "1", 106 to 108=> "0", 109 to 112=> "1", 113 => "0", 114 to 115=> "1", 116 to 117=> "0", 
    118 => "1", 119 to 121=> "0", 122 to 123=> "1", 124 => "0", 125 to 126=> "1", 127 to 128=> "0", 129 => "1", 
    130 to 132=> "0", 133 to 136=> "1", 137 to 140=> "0", 141 => "1", 142 => "0", 143 to 146=> "1", 147 to 150=> "0", 
    151 => "1", 152 => "0", 153 to 155=> "1", 156 to 157=> "0", 158 to 159=> "1", 160 to 167=> "0", 168 to 169=> "1", 
    170 => "0", 171 to 173=> "1", 174 => "0", 175 => "1", 176 => "0", 177 to 179=> "1", 180 => "0", 
    181 to 184=> "1", 185 to 186=> "0", 187 to 190=> "1", 191 to 194=> "0" );

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

entity predict_ensemble_cwx is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_cwx is
    component predict_ensemble_cwx_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cwx_rom_U :  component predict_ensemble_cwx_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


